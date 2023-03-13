import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/categorynews.dart';
import 'package:newsapi/imagepage.dart';
import 'package:newsapi/object/apinewsindo.dart';
import 'package:newsapi/services/font.dart';
import 'package:newsapi/services/http.dart';
import 'package:newsapi/webview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ApiNewsIndoCategory>? apiNewsIndoCategory;
  // String category = 'antara';
  int indexNews = 0;
  @override
  void initState() {
    apiNewsIndoCategory = API().apiNewsIndoCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Font.regular(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<ApiNewsIndoCategory>(
        future: apiNewsIndoCategory,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.connectionState != ConnectionState.waiting) {
            List<Endpoints> apiNewsCategory = snapshot.data!.endpoints!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: apiNewsCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Endpoints endpoints = apiNewsCategory[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: OutlinedButton(
                          style: indexNews != index
                              ? OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(
                                    color: Colors.red,
                                  ))
                              : OutlinedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  side: const BorderSide(
                                    color: Colors.green,
                                  )),
                          onPressed: () {
                            setState(() {
                              indexNews = index;
                            });
                          },
                          child: Text(
                            endpoints.name!.toUpperCase(),
                            style: Font.regular(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListCard(
                    apiNewsCategory: apiNewsCategory,
                    indexNews: indexNews,
                  ),
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

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.apiNewsCategory,
    required this.indexNews,
  }) : super(key: key);

  final List<Endpoints> apiNewsCategory;
  final int indexNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apiNewsCategory[indexNews].paths!.length,
      itemBuilder: (context, index) {
        Paths paths = apiNewsCategory[indexNews].paths![index];
        return FutureBuilder<ApiNewsIndo>(
          future: API().apiNewsIndo(paths.path!),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting &&
                snapshot.data != null) {
              if (snapshot.data!.success != false) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriNews(
                        data: snapshot.data!.data!,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 240, 240, 240),
                          Colors.white,
                        ],
                      ),
                    ),
                    child: CardNews(
                      data: snapshot.data!.data!,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 240, 240, 240),
                      Colors.white,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}

class CardNews extends StatelessWidget {
  const CardNews({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Data data;
  static Future<ApiNewsIndo>? apiNewsIndo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            data.title!,
            style: Font.regular(),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.9,
            initialPage: 0,
            reverse: false,
            autoPlay: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.decelerate,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
          ),
          items: data.posts!.map((i) {
            int random = Random().nextInt(data.posts!.length);
            return Stack(
              fit: StackFit.expand,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewWeb(
                          link: i.link!,
                        ),
                      ),
                    ),
                    onLongPress: () => context.pushTransparentRoute(
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 500),
                      ImagePage(
                        imageUrl: i.thumbnail!,
                        tag: i.thumbnail! + random.toString(),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Hero(
                        tag: i.thumbnail! + random.toString(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ExtendedImage.network(
                            i.thumbnail!,
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.all(
                        15,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Text(
                        i.title!,
                        style: Font.regular(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
