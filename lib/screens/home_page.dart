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
import 'package:bordered_text/bordered_text.dart';

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
    return Scaffold(
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
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ComingSoon(
                                    //               movie: movie,
                                    //               index: index,
                                    //             )));
                                  setState(() {
                                    _onButtonPressed(index: index, movie: movie);
                                  });
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
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ComingSoon(
                                    //               movie: movie,
                                    //               index: index,
                                    //             )));
                                    setState(() {
                                      _onButtonPressed(index: index, movie: movie);
                                    });
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
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                final movie = snapshot.data!.results![index];
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ComingSoon(
                                    //               movie: movie,
                                    //               index: index,
                                    //             )));
                                    setState(() {
                                      _onButtonPressed(index: index, movie: movie);
                                    });
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 150,
                                    decoration:const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 15,
                                          spreadRadius: 10,
                                          offset: Offset(
                                            8,0
                                          )
                                        )],
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          right:0,
                                          child: Container(
                                              //padding: EdgeInsets.all(5),
                                              width: 110,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(25)),
                                              child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  child:
                                                  FadeInImage.assetNetwork(
                                                    placeholder:
                                                    "imageAssets/anjamPathira.PNG",
                                                    image:
                                                    "https://www.themoviedb.org/t/p/original${movie.posterPath ?? movie.backdropPath}",
                                                    fit: BoxFit.cover,
                                                  )
                                              )
                                          ),
                                        ),
                                        Positioned(left: 0,top: 65,
                                            child:
                                            BorderedText(strokeWidth: 3,
                                                strokeColor: Colors.white,
                                                child: text(text:"${10-index}",
                                                    fontSize: 80,fontWeight: FontWeight.bold,color: Colors.black ))),
                                      ],
                                    ),
                                  ),
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
    );
  }
void _onButtonPressed({required int index,required var movie}){
    showModalBottomSheet(backgroundColor: Color(0xff404040),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),

          )
        ),
        context: context, builder: (context){
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topLeft: const Radius.circular(10),
           topRight: const Radius.circular(10)
         )
       ),
        child: SizedBox(
          height: 142,
          width: 400,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      width: 100,
                      height: 140,
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
                  SizedBox(
                    height: 144,
                    width: MediaQuery.of(context).size.width-110,
                    child: Column(
                      children: [
                        ListTile(
                          title: text(text:movie.originalTitle,fontWeight: FontWeight.bold,fontSize: 15),
                          trailing: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel,color: Colors.white,
                            ),
                          ),
                          subtitle: text(text: "2018  16+ 12 Seasons",color: Colors.grey,fontSize: 13),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(movie.overview,overflow: TextOverflow.values[2],style: TextStyle(color: Colors.white,),
                          maxLines: 3,),
                        ),
                        //text(text: movie.overview),

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*.99,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    elevatedButton(icon:  Icon(Icons.play_arrow,color: Colors.black,), texts:"Play"),
                    iconAndNameColumn(icon: Icon(Icons.download,color: Colors.white,), iconText: "Download"),
                    iconAndNameColumn(icon: Icon(Icons.play_arrow_outlined,color: Colors.white,), iconText: "Preview"),
                  ],
                ),
              )
            ],
          ),
        ),
      );

    });
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
