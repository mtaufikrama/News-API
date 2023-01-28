import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/imagepage.dart';
import 'package:newsapi/object/apinewsindo.dart';
import 'package:newsapi/services/http.dart';
import 'package:newsapi/services/launcher.dart';
import 'package:newsapi/services/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ApiNewsIndoCategory>? apiNewsIndoCategory;
  String category = 'antara';
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
        title: Text(widget.title),
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
                    itemCount: apiNewsCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Endpoints endpoints = apiNewsCategory[index];
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            category = endpoints.name!;
                            indexNews = index;
                            listData.clear();
                          });
                          print(category);
                        },
                        child: Text(endpoints.name!),
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
    // apiNewsCategory[indexNews].paths!.map((e) => null);
    return ListView.builder(
      itemCount: apiNewsCategory[indexNews].paths!.length,
      itemBuilder: (context, index) {
        Paths paths = apiNewsCategory[indexNews].paths![index];
        return FutureBuilder<ApiNewsIndo>(
          future: API().apiNewsIndo(paths.path!),
          builder: (context, snapshot) {
            return CardNews(paths: paths);
          },
        );
      },
    );
  }
}

class CardNews extends StatefulWidget {
  const CardNews({
    Key? key,
    required this.paths,
  }) : super(key: key);

  final Paths paths;

  @override
  State<CardNews> createState() => _CardNewsState();
}

class _CardNewsState extends State<CardNews> {
  // Future<ApiNewsIndo>? apiNewsIndo;
  @override
  void initState() {
    // apiNewsIndo = API().apiNewsIndo(widget.paths.path!);
    baca();
    super.initState();
  }

  void baca() async {
    ApiNewsIndo apiNewsIndo = await API().apiNewsIndo(widget.paths.path!);
    listData.add(apiNewsIndo.data!);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        Data data = listData[index];
        return Column(
          children: [
            ListTile(
              title: Text(data.title!),
            ),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.decelerate,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
              items: data.posts!.map((i) {
                int random = Random().nextInt(data.posts!.length);
                return Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: GestureDetector(
                        onTap: () => launcher(i.link!),
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
                            style: const TextStyle(
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
      },
    );
  }
}
