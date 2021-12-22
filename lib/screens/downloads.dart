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
                    itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context,index){
                      var _apiDatas =snapshot.data!.results![index];
                        return ListTile(
                          leading: SizedBox(height: MediaQuery.of(context).size.height*.3,
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
            })
          ],
        ),
      ),
    );
  }
}


