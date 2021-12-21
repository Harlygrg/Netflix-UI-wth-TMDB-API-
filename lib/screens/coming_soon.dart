import 'package:flutter/material.dart';
import 'package:netflix_clone/actions/http_service.dart';
import 'package:netflix_clone/actions/refactored_widgets.dart';
import 'package:netflix_clone/actions/user_model.dart';

class ComingSoon extends StatelessWidget {
   ComingSoon({Key? key}) : super(key: key);
  API_Manager _api_manager = API_Manager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Coming Soon",style: TextStyle(fontSize: 17),),
          actions: [
            appbarActionsRow(onTap: () {

            }),
          ],
        ),
        body:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                tileColor: Colors.black,
                leading: Icon(Icons.notifications,color: Colors.white,),
                title: text(text: "Notifications",color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                trailing:  Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.7,
                child: FutureBuilder<UserModel>(
                  future: _api_manager.apiDatas(apiUrlString: apiUrl),
                  builder: (context,snapshot){
                    return !snapshot.hasData ? Center(child: CircularProgressIndicator(),)
                        : ListView.builder(
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder:(context,index){
                      var valueFromApi =snapshot.data!.results![index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height/3,
                            width:MediaQuery.of(context).size.width,
                            child: Image.network( "https://www.themoviedb.org/t/p/original"
                                "${valueFromApi.posterPath ?? valueFromApi.backdropPath}",fit: BoxFit.fill,),
                          ),
                          divider(height: 10, width: 0),
                         LinearProgressIndicator(
                           backgroundColor: Color(0xff834436),
                           minHeight: 2,
                           valueColor: AlwaysStoppedAnimation(Colors.red,),
                           value: .2,

                         ),
                          divider(height: 5, width: 0),
                          
                          ListTile(
                            leading:SizedBox(height: MediaQuery.of(context).size.height/15,
                              width:50,
                              child: Image.network( "https://www.themoviedb.org/t/p/original"
                                  "${valueFromApi.posterPath ?? valueFromApi.backdropPath}",fit: BoxFit.fill,)
                            ),
                            trailing: SizedBox(height: 34,width:100,
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  iconAndNameColumn(icon: Icon(Icons.notifications,color: Colors.white,),
                                      iconText: "Remind Me",fontSize: 8,textColor: Colors.grey ),
                                  iconAndNameColumn(icon:const Icon(Icons.info_outlined, color: Colors.white,),
                                      iconText: "info",fontSize: 8,textColor: Colors.grey ),
                                ],
                              ),
                            ),
                          ),
                          divider(height: 15, width: 0),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: text(text: "Coming on Friday",color:Colors.grey,fontSize: 12, ),
                          ),
                          divider(height: 10, width: 0),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: text(text: valueFromApi.title.toString(),fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          divider(height: 10, width: 0),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: text(text: valueFromApi.overview.toString(),fontSize: 13,color: Colors.grey),
                          ),
                          divider(height: 10, width: 0),
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
                          divider(height: 10, width: 0),
                        ],
                      );
                    });
                  },
                )

              ),

            ],
          ),
        )
    );
  }
}

