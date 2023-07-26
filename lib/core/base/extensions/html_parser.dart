import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

extension StringExtension on String {
  String parseHtml() {
    final document = parser.parse(this);
    final buffer = StringBuffer();

    void parseNode(dom.Node node) {
      if (node is dom.Element) {
        if (node.localName == 'br') {
          buffer.write('\n');
        } else {
          for (var child in node.nodes) {
            parseNode(child);
          }
        }
      } else if (node is dom.Text) {
        buffer.write(node.text);
      }
    }

    parseNode(document.body!);

    return buffer.toString();
  }
}
