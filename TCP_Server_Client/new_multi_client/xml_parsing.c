#include <libxml2/libxml/parser.h>
#include <libxml2/libxml/xpath.h>
#include <libxml2/libxml/xmlversion.h>
#include  <stdio.h>
#include <stdlib.h>
xmlDocPtr load_xml_doc(char *xml_file_path) {
    xmlDocPtr doc = xmlParseFile(xml_file_path);
    if (doc == NULL) {
        fprintf(stderr, "ERROR: Document not parsed successfully. \n");
        return NULL;
    }
    return doc;
}

/**
 * Extract the nodes matching the given xpath from the supplied
 * XML document object.
 */
xmlXPathObjectPtr get_nodes_at_xpath(xmlDocPtr doc, xmlChar *xpath) {

    xmlXPathContextPtr context = xmlXPathNewContext(doc);
    if (context == NULL) {
        printf("ERROR: Failed to create xpath context from the XML document.\n");
        return NULL;
    }
    xmlXPathObjectPtr result = xmlXPathEvalExpression(xpath, context);
    xmlXPathFreeContext(context);
    if (result == NULL) {
        printf("ERROR: Failed to evaluate xpath expression.\n");
        return NULL;
    }
    if (xmlXPathNodeSetIsEmpty(result->nodesetval)) {
        xmlXPathFreeObject(result);
        printf("No matching nodes found at the xpath.\n");
        return NULL;
    }
    return result;
}

/**
 * Returns the text value of an XML element. It is expected that
 * there is only one XML element at the given xpath in the XML.
 */
xmlChar* get_element_text(char *node_xpath, xmlDocPtr doc) {
    xmlChar *node_text;
    xmlXPathObjectPtr result = get_nodes_at_xpath(doc, 
        (xmlChar*)node_xpath);
    if (result) {
        xmlNodeSetPtr nodeset = result->nodesetval;
        if (nodeset->nodeNr == 1) {
            node_text = xmlNodeListGetString(doc,
                nodeset->nodeTab[0]->xmlChildrenNode, 1);
        } else {
            printf("ERROR: Expected one %s node, found %d\n", node_xpath, nodeset->nodeNr);
        }
        xmlXPathFreeObject(result);
    } else {
        printf("ERROR: Node not found at xpath %s\n", node_xpath);
    }
    return node_text;
}

/**
 * Following XML sample is used to test this program.
 *
Output expected is:
    MessageID=A9ECAEF2-107A-4452-9553-043B6D25386E
    Sender=756E2EAA-1D5B-4BC0-ACC4-4CEB669408DA
    Destination=6393F82F-4687-433D-AA23-1966330381FE
    MessageType=CreditReport
    Payload=001-01-1234
*/
int main(int argc, char **argv) {
    char *docname = "BMD.xml";
    xmlDocPtr doc = load_xml_doc(docname);
    printf("MessageID=%s\n", get_element_text("//MessageID", doc));
    printf("Sender=%s\n", get_element_text("//Sender", doc));
    printf("Destination=%s\n", get_element_text("//Destination", doc));
    printf("MessageType=%s\n", get_element_text("//MessageType", doc));
    printf("Payload=%s\n", get_element_text("//Payload", doc));
    xmlFreeDoc(doc);
    xmlCleanupParser();
    return 1;
}
