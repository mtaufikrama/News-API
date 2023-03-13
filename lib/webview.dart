import 'package:flutter/material.dart';
import 'package:newsapi/services/font.dart';
import 'package:webview_flutter/webview_flutter.dart';

TextEditingController linkController = TextEditingController();

class ViewWeb extends StatelessWidget {
  const ViewWeb({
    super.key,
    required this.link,
  });
  final String link;

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(link));
    linkController.text = link;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: TextFormField(
          controller: linkController,
          onEditingComplete: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ViewWeb(link: linkController.text),
            ),
          ),
          style: Font.regular(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
