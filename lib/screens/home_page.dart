


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget text ({required String text,
    FontWeight fontWeight=FontWeight.normal,
  double fontSize =13,
  Color color =Colors.white}

      ){
    return Text(text,style: TextStyle(fontSize: fontSize,
      fontWeight: fontWeight,
      color: color
        ),);
  }
  Widget iconAndNameColumn({
  required Icon icon,
    required String iconText
}){
    return Column(
      children: [
        icon,
        text(text: iconText,fontSize: 12,color: Colors.white),
      ],
    );
  }
 late int tabIndex;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 350,
              toolbarHeight: 65,
              backgroundColor: Colors.transparent,
              title: Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(text: "TV shows"),
                      text(text: "Movies"),
                      SizedBox(
                        child: Row(
                          children: [
                            text(text: "Categories"),
                            Icon(Icons.arrow_drop_down,size: 25,color: Colors.white,),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              leading: Image.network("https://1000logos.net/wp-content/"
                  "uploads/2017/05/Netflix-Logo-2006.png",scale: .20,),
              actions:
              [
                Row(

                  children: [
                    Image.network("https://upload.wikimedia.org/wikipedia"
                        "/commons/thumb/2/26/Chromecast_cast_button_icon.svg"
                        "/2048px-Chromecast_cast"
                        "_button_icon.svg.png",color: Colors.white,scale: 70,),
                    SizedBox(width: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network("https://encrypted-"
                          "tbn0.gstatic.com/images?q=tbn:"
                          "ANd9GcQa6mnkESGGXpL32uVzQNDLcs"
                          "AidQyxUkjADA&usqp=CAU",scale:9,),
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background:  Image.network("https://www.plumeriamovies.com/"
                    "wp-content/uploads/2019/11/the-king-Netflix.jpg",fit: BoxFit.cover,)
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10,top: 8,bottom: 8),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black,Colors.black],
                              begin:Alignment.bottomCenter,
                              end: Alignment.topCenter,

                          )
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 25,),
                            text(text: "Slick"),
                            Icon(Icons.fiber_manual_record,size: 8,color: Colors.white,),
                            text(text: "Drama",),
                            Icon(Icons.fiber_manual_record,size: 12,color: Colors.white,),
                            text(text: "Con Game",),
                            Icon(Icons.fiber_manual_record,size: 8,color: Colors.white,),
                            text(text: "Vintage Crime",),
                            Icon(Icons.fiber_manual_record,size: 12,color: Colors.white,),
                            text(text: "On the run",),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            iconAndNameColumn(icon: Icon(Icons.add,size: 25,
                              color: Colors.white,),iconText: "My List",),
                            ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  primary: Colors.white,// background
                                  onPrimary: Colors.white, // foreground
                                ),
                                child:
                                Row(
                                  children: [
                                    Icon(Icons.play_arrow,color: Colors.black,),
                                    text(color: Colors.black,text: "Play")
                                  ],
                                )
                            ),
                            iconAndNameColumn(icon: Icon(Icons.info_outlined,
                              color: Colors.white,),iconText: "info",),
                          ],),
                        SizedBox(height: 15,),
                        text(text: "Top 10 in Inda Today",fontSize: 16,fontWeight: FontWeight.w500),
                        Container(
                          //width: 100,
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context,index){
                            return Container(
                              padding: EdgeInsets.all(5),
                              width: 110,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                  child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images"
                                      "/got-1618347198.jpeg?crop=0.502xw:1.00xh;0.250xw,0&resize=640:*",fit: BoxFit.cover,)),
                            );
                          }
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      //   bottomNavigationBar: SizedBox(
      //     child: BottomNavigationBar(
      //       onTap: (index){
      //         setState(() {
      //
      //         });
      //       },
      //       items: const <BottomNavigationBarItem>[
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.call),
      //           label: 'Calls',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.camera),
      //           label: 'Camera',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.chat),
      //           label: 'Chats',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.chat),
      //           label: 'Chats',
      //         ),
      //       ],
      // ),
      //   )
      ),
    );
  }

}
