import 'package:flutter/material.dart';
import 'package:netflix_clone/actions/http_service.dart';
import 'package:netflix_clone/actions/refactored_widgets.dart';
import 'package:netflix_clone/actions/user_model.dart';

class FastLaugh extends StatelessWidget {
   FastLaugh({Key? key}) : super(key: key);
API_Manager _api_manager = API_Manager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SizedBox(
            child: FutureBuilder<UserModel>(
              future: _api_manager.apiDatas(apiUrlString: apiUrl4),
              builder: (BuildContext context, snapshot){
                return !snapshot.hasData ? Center(child: CircularProgressIndicator(),) :
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(itemBuilder: (context,index){
                      var _apiData = snapshot.data!.results![index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 1,bottom: 1),
                        child: SizedBox(
                          child: Stack(
                            children:<Widget>[
                              SizedBox(height: MediaQuery.of(context).size.height,
                                width:MediaQuery.of(context).size.width,
                                child: Image.network( "https://www.themoviedb.org/t/p/original"
                                    "${ _apiData.posterPath ??  _apiData.backdropPath}",fit: BoxFit.fill,)
                              ),
                              Positioned(bottom: 350,right: 15,
                                  child: iconAndNameColumn(
                                    icon: const Icon(Icons.emoji_emotions,color: Colors.white,size: 25,),
                                  iconText: "LOL",fontSize: 15),),
                              Positioned(bottom: 280,right: 15,
                                child: iconAndNameColumn(
                                    icon: const Icon(Icons.add,color: Colors.white,size: 25,),
                                    iconText: "My List",fontSize: 15),),
                              Positioned(bottom: 210,right: 15,
                                child: iconAndNameColumn(
                                    icon: const Icon(Icons.send,color: Colors.white,size: 25,),
                                    iconText: "Share",fontSize: 15),),
                              Positioned(bottom: 140,right: 15,
                                child: iconAndNameColumn(
                                    icon: const Icon(Icons.play_arrow,color: Colors.white,size: 25,),
                                    iconText: "Play",fontSize: 15),),
                              Positioned(bottom: 50,left: 15,
                                child:Container(
                                  width: 60,height: 60,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                ),),
                            ],
                          ),

                        ),
                      );
                    }),
                  );
              },
            ),
        ));
  }
}

