import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/actions/http_service.dart';
import 'package:netflix_clone/actions/refactored_widgets.dart';
import 'package:netflix_clone/actions/user_model.dart';


class Downloads extends StatelessWidget {
   Downloads({Key? key}) : super(key: key);

  API_Manager _api_manager =API_Manager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Downloads",style: TextStyle(fontSize: 17),),
        actions: [
          appbarActionsRow(onTap: () {

          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              text(text: "Smart Downloads",fontWeight: FontWeight.bold,color: Colors.white),
              Icon(Icons.edit,color: Colors.white,size: 18,),
            ],),
            divider(width: 0,height: 10),
            SizedBox(width: 100,height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [  SizedBox(
                  width: 30,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      "https://encrypted-"
                          "tbn0.gstatic.com/images?q=tbn:"
                          "ANd9GcQa6mnkESGGXpL32uVzQNDLcs"
                          "AidQyxUkjADA&usqp=CAU",
                      scale: 9,
                    ),
                  ),
                ),
                text(text: "Name",fontSize: 16,)
                ],
              ),
            ),
            divider(height: 10, width: 0),
            FutureBuilder<UserModel>(
              future: _api_manager.apiDatas(apiUrlString: apiUrl5),
                builder: (BuildContext context,snapshot){
              return !snapshot.hasData ? Center(child: CircularProgressIndicator(),):
                Expanded(
                  child: ListView.builder(
                    itemCount:1,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context,index){
                      var _apiDatas =snapshot.data!.results![index];
                        return ListTile(
                          leading: SizedBox(height: MediaQuery.of(context).size.height*.4,
                            width:MediaQuery.of(context).size.width*.3,
                            child: Image.network( "https://www.themoviedb.org/t/p/original"
                                "${_apiDatas.posterPath ?? _apiDatas.backdropPath}",fit: BoxFit.fill,),
                          ),
                          title: text(text: "Name"),
                          subtitle: text(text: "18+ | 10 Episodes | 10.3 GB",fontSize: 10,color: Colors.grey),
                          trailing:  Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                        );
                      }),
                );
            }),
            Container(
            height:MediaQuery.of(context).size.height/1.65,
              //color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.grey,),
                    divider(height: 5, width: 0),
                    text(text:"Introducing Downloads for you",fontSize: 16,fontWeight: FontWeight.bold ),
                    divider(height: 10, width: 0),
                    text(text:downlodDescriptn,fontSize: 13,color: Colors.grey ),
                    Center(
                      child: Container(
                        width: 250,height: 250,
                        decoration: BoxDecoration(
                          color: Color(0xff303030),
                          borderRadius: BorderRadius.circular(125)
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Positioned(
                                top: 55,left: 0,
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(329 / 360),
                                  child: SizedBox(
                                    height: 165,width: 140,
                                    child: Image.asset("imageAssets/minnal.PNG"),
                                  ),
                                )),
                            Positioned(
                              top: 65,left: 120,
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(391 / 360),
                                  child: SizedBox(
                                    height: 165,width: 140,
                                    child: Image.asset("imageAssets/puli.PNG"),
                                  ),
                                )),
                            Positioned(left: 55,top: 35,
                                child: SizedBox(
                                  height: 190,width: 140,
                                  child: Image.asset("imageAssets/anjamPathira.PNG"),
                                )),
                          ],
                        ),
                      ),
                    ),
                    divider(height: 5, width: 0),
                    SizedBox(width: MediaQuery.of(context).size.width*.95,
                      child: ElevatedButton(onPressed: (){},
                          child: text(text: "SET UP",fontSize: 13),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: Colors.blue
                        )
                      ),
                    ),
                    divider(height: 5, width: 0),
                    Center(
                      child: SizedBox(width: MediaQuery.of(context).size.width*.65,
                        child: ElevatedButton(onPressed: (){},
                            child: text(text: "Find more to download",fontSize: 13),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                primary: Color(0xff303030)
                            )
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


