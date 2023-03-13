// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:universal_html/html.dart';

downloadFile(String url) {
  AnchorElement anchorElement = AnchorElement(href: url);
  print("${anchorElement.download!} ${anchorElement.localName}");
  anchorElement.click();
}
