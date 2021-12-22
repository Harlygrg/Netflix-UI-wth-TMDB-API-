import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/actions/refactored_widgets.dart';
import 'package:netflix_clone/screens/home_page.dart';
import 'package:netflix_clone/screens/details_page.dart';
import 'package:netflix_clone/screens/downloads.dart';

class ComingSoon extends StatefulWidget {
  final movie;
  final index;
  const ComingSoon({Key? key,required this.movie,this.index}) : super(key: key);

  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {


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
  Widget divider({required double height, required double width}){
    return SizedBox(height: height,width: width,);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body:  SingleChildScrollView(
        child: SafeArea(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: Image.network("https://www.themoviedb.org/t/p/original${widget.movie.posterPath ?? widget.movie.backdropPath}",
                height: 300,fit: BoxFit.fill,),
            ),
            divider(height: 5, width: 0),
           Container(
             padding: EdgeInsets.only(left: 10,right: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 text(text: widget.movie.originalTitle,fontWeight: FontWeight.bold,fontSize: 15),
                 divider(height: 5, width: 0),
                 Row(
                   children: [
                     RichText(
                       text: TextSpan(
                           children: <TextSpan>[
                             TextSpan(
                               text: "Top rated 89",style: TextStyle(color: Colors.green,fontSize: 13),
                             ),TextSpan(
                               text: "  2017",style: TextStyle(color: Colors.white,fontSize: 16),
                             )
                           ]
                       ),
                     ),
                     divider(height: 0, width: 5),
                     Container(
                       width: 22,height: 15,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(3),
                         color: Colors.black12,
                       ),
                       child: Center(child: text(text: widget.movie.adult?"18+":"",fontSize: 10,color: Colors.white)),
                     ),    divider(height: 0, width: 5),
                     text(text: "6 Seasons",fontSize: 16,),
                   ],
                 ),
                 divider(height: 5, width: 0),
                 elevatedButton(icon:  Icon(Icons.play_arrow,color: Colors.black,), texts:"Play"),
                 elevatedButton(icon:  Icon(Icons.download,color: Colors.white,),
                     texts:"Download",buttonColor: Colors.white38,textColor: Colors.white),
                 divider(height: 5, width: 0),
                 text(text: widget.movie.overview),
                 divider(height: 5, width: 0),
                 text(text: "cast:Tom Cruz, Anjelena",color: Colors.grey),
                 divider(height: 5, width: 0),
                 Row(
                   children: [
                     divider(height: 00, width: 20),
                     buttons(icon:   Icon(Icons.add, size: 25,color: Colors.white,), texts: "My List"),
                     divider(height: 0, width: 50),
                     buttons(icon:   Icon(Icons.thumb_up_alt_sharp, size: 20,color: Colors.white,), texts: "Rate"),
                     divider(height: 0, width: 50),
                     buttons(icon:   Icon(Icons.share, size: 25,color: Colors.white,), texts: "Share")
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: SizedBox(width: 60,child: Divider(color: Colors.red,thickness: 3,),),
                 ),
                 RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(
                           text: "Episodes",style: TextStyle(color: Colors.white,
                             fontSize: 18,fontWeight: FontWeight.bold),
                         ),TextSpan(
                           text: "  More like this",style: TextStyle(color: Colors.grey,
                            fontSize: 18,fontWeight: FontWeight.bold),
                         )
                       ]
                   ),
                 ),
               ],
             ),
           ),
          ],
        )),
      ),
    );
  }
  Widget buttons({
    required Icon icon,
    required String texts,
}){
    return Container(
      child: Column(
        children: [
          icon,
          text(text: texts,color: Colors.grey),
        ],
      ),
    );
  }

}
