import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/actions/user_model.dart';
import 'package:netflix_clone/actions/http_service.dart';
import 'package:netflix_clone/screens/coming_soon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  class SearchScreen extends StatefulWidget {
  final String ?text;
  final ValueChanged<String> ?onChanged;
  final String ?hintText;
  const SearchScreen({Key? key,this.text,this.onChanged,this.hintText}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String ? onChanged;
  API_Manager _api_manager(){
    API_Manager _api_manager = API_Manager(onchanged: onChanged);
    return _api_manager;
  }
  //API_Manager _api_manager = API_Manager();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.network(
              "https://encrypted-"
                  "tbn0.gstatic.com/images?q=tbn:"
                  "ANd9GcQa6mnkESGGXpL32uVzQNDLcs"
                  "AidQyxUkjADA&usqp=CAU",
              scale: 9,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  child: SizedBox(
                    child: TextFormField(
                      controller: _controller,
                      style:const TextStyle(color: Colors.white),
                      decoration:const InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        suffixIcon: Icon(Icons.mic_rounded,color: Colors.white),
                        hintText: "Search for a show, movie, genre etc..",
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.grey,
                        border: InputBorder.none,
                      ),
                      onChanged:(String text){

                        setState(() {
                          onChanged = text.replaceAll(" ", "%20");

                        });
                      },
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Top Searches",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              Expanded(
                child: FutureBuilder<UserModel>(
                    future: _api_manager().createData(),
                    builder:(context,snapshot){
                     if(!snapshot.hasData){
                       return Center(child: CircularProgressIndicator(),);
                     }
                  return ListView.builder(
                      itemCount:snapshot.data!.results!.length,
                      itemBuilder: (context,index){
                        var data = snapshot.data!.results![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: SizedBox(height: 50,width: 50,
                                child: Image.network(  "https://www.themoviedb.org/t/p/original"
                                    "${data.posterPath ?? data.backdropPath}",fit:BoxFit.contain ,)),
                            title:  Text("${data.title}",style:const TextStyle(color: Colors.white),),
                            trailing: const Icon(Icons.play_arrow,color: Colors.white,),
                            onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=>ComingSoon(movie: data)));
                            },
                          ),
                        );
                      }
                  );
                }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
