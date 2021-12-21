import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/actions/refactored_widgets.dart';
import 'package:netflix_clone/actions/user_model.dart';
import 'package:netflix_clone/actions/http_service.dart';
import 'package:netflix_clone/screens/details_page.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  API_Manager _api_manager = API_Manager();


  late int tabIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(
            physics: ScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: true,
                expandedHeight: 350,
                toolbarHeight: 65,
                backgroundColor: Colors.transparent,
                title: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(text: "TV shows"),
                        text(text: "Movies"),
                        SizedBox(
                          child: Row(
                            children: [
                              text(text: "Categories"),
                              const Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                leading: Image.network(
                  "https://1000logos.net/wp-content/"
                  "uploads/2017/05/Netflix-Logo-2006.png",
                  scale: .20,
                ),
                actions: [
                  appbarActionsRow(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  }),
                ],
                flexibleSpace: FlexibleSpaceBar(
                    background: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 326,
                        child: Image.network(
                          "https://www.plumeriamovies.com/"
                          "wp-content/uploads/2019/11/the-king-Netflix.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                          text(text: "Slick"),
                          const Icon(
                            Icons.fiber_manual_record,
                            size: 8,
                            color: Colors.white,
                          ),
                          text(
                            text: "Drama",
                          ),
                          const Icon(
                            Icons.fiber_manual_record,
                            size: 12,
                            color: Colors.white,
                          ),
                          text(
                            text: "Con Game",
                          ),
                          const Icon(
                            Icons.fiber_manual_record,
                            size: 8,
                            color: Colors.white,
                          ),
                          text(
                            text: "Vintage Crime",
                          ),
                          const Icon(
                            Icons.fiber_manual_record,
                            size: 12,
                            color: Colors.white,
                          ),
                          text(
                            text: "On the run",
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        iconAndNameColumn(
                          icon: const Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.white,
                          ),
                          iconText: "My List",
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              primary: Colors.white, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                text(color: Colors.black, text: "Play")
                              ],
                            )),
                        iconAndNameColumn(
                          icon: const Icon(
                            Icons.info_outlined,
                            color: Colors.white,
                          ),
                          iconText: "info",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    text(
                        text: "Trending",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: FutureBuilder<UserModel>(
                        future: _api_manager.apiDatas(apiUrlString: apiUrl),
                        builder: (BuildContext context,
                            AsyncSnapshot<UserModel> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                primary: true,
                                physics: ScrollPhysics(),
                                itemCount: snapshot.data!.results!.length,
                                itemBuilder: (context, index) {
                                  final movie = snapshot.data!.results![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ComingSoon(
                                                    movie: movie,
                                                    index: index,
                                                  )));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        width: 110,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              "https://www.themoviedb.org/t/p/original${movie.posterPath ?? movie.backdropPath}",
                                              fit: BoxFit.cover,
                                            ))),
                                  );
                                });
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    text(
                        text: "Upcoming",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: 150,
                      child: FutureBuilder(
                        future: _api_manager.apiDatas(apiUrlString: apiUrl4),
                        builder: (BuildContext context,
                            AsyncSnapshot<UserModel> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.results!.length,
                                itemBuilder: (context, index) {
                                  final movie = snapshot.data!.results![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ComingSoon(
                                                    movie: movie,
                                                    index: index,
                                                  )));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        width: 110,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              "https://www.themoviedb.org/t/p/original${movie.posterPath ?? movie.backdropPath}",
                                              fit: BoxFit.cover,
                                            ))),
                                  );
                                });
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    text(
                        text: "Popular",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: 150,
                      child: FutureBuilder(
                        future: _api_manager.apiDatas(apiUrlString: apiUrl5),
                        builder: (BuildContext context,
                            AsyncSnapshot<UserModel> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.results!.length,
                                itemBuilder: (context, index) {
                                  final movie = snapshot.data!.results![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ComingSoon(
                                                    movie: movie,
                                                    index: index,
                                                  )));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        width: 110,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  "imageAssets/money_manager_icon_for_about.png",
                                              image:
                                                  "https://www.themoviedb.org/t/p/original${movie.posterPath ?? movie.backdropPath}",
                                              fit: BoxFit.cover,
                                            ))),
                                  );
                                });
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget gesture({
    required Function() onTap,
    required String imageUrl,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(5),
          width: 110,
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ))),
    );
  }
}
