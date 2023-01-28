import 'package:flutter/material.dart';
import 'package:newsapi/object/apinewsindo.dart';
import 'package:newsapi/services/http.dart';
import 'package:newsapi/services/launcher.dart';

class CategoriNews extends StatelessWidget {
  const CategoriNews({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita'),
      ),
      body: FutureBuilder<ApiNewsIndo>(
        future: API().apiNewsIndo(url),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.connectionState != ConnectionState.waiting) {
            Data dataApiNewsIndo = snapshot.data!.data!;
            return ListView(
              children: [
                ListTile(
                  title: Text(dataApiNewsIndo.title!),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(dataApiNewsIndo.image!),
                    backgroundColor: Colors.white,
                  ),
                  subtitle: Text(dataApiNewsIndo.description!),
                ),
                Column(
                  children: dataApiNewsIndo.posts!
                      .map(
                        (e) => TextButton(
                          onPressed: () async {
                            print('launcher');
                            await launcher(e.link!);
                          },
                          child: ListTile(
                            title: Image.network(e.thumbnail!, fit: BoxFit.contain,),
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
                                  style: const TextStyle(
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
