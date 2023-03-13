import 'package:dismissible_page/dismissible_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/services/download.dart';
import 'package:newsapi/services/launcher.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key, required this.imageUrl, required this.tag});

  final String imageUrl;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.of(context).pop();
      },
      startingOpacity: 0.7,
      backgroundColor: Colors.black,
      direction: DismissiblePageDismissDirection.multi,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: responsive(
            context,
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Hero(
                    tag: tag,
                    child: ExtendedImage.network(
                      imageUrl,
                      cache: true,
                    ),
                  ),
                ),
              ],
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Hero(
                    tag: tag,
                    child: GestureDetector(
                      onTap: () => downloadFile(imageUrl),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        // fitWeb: BoxFitWeb.contain,
                      ),
                    ),
                    // ImageNetwork(
                    //   image: imageUrl,
                    //   fitAndroidIos: BoxFit.contain,
                    //   height: 100,
                    //   width: 100,
                    // ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
      // Scaffold(
      //   backgroundColor: Colors.transparent,
      //   body: ListTile(
      //     title: Hero(
      //       tag: tag,
      //       child: Image.asset(
      //         imageUrl,
      //         fit: BoxFit.contain,
      //         height: 200,
      //       ),
      //     ),
      //   ),
      // ),
