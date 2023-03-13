import 'package:flutter/material.dart';
import 'package:newsapi/object/apinewsindo.dart';
import 'package:newsapi/services/font.dart';
import 'package:newsapi/webview.dart';

class CategoriNews extends StatelessWidget {
  const CategoriNews({super.key, required this.data});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text(
          data.title!,
          style: Font.regular(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(data.title!),
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                data.image!,
                fit: BoxFit.contain,
              ),
            ),
            subtitle: Text(data.description!),
          ),
          Column(
            children: data.posts!
                .map(
                  (e) => TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewWeb(
                          link: e.link!,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: ListTile(
                      title: Image.network(
                        e.thumbnail!,
                        fit: BoxFit.contain,
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            e.pubDate!.substring(0, 10),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            e.title!,
                            style: Font.regular(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            e.description!,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
