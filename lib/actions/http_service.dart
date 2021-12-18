import 'package:flutter/material.dart';
import 'package:netflix_clone/actions/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final String apiUrl ="https://api.themoviedb.org/3/movie/top_rated?api_key=b691875b6959a2995d4d8bbb9e13c8be&language=en-US&page=1 ";
class API_Manager{
  UserModel ?_user;
  var apiResponseString;
  var apiMap;

  Future<UserModel> createData()async{
    var client = http.Client();
    var userModel =null;
   try {
      var apiResponse = await http.get(Uri.parse(apiUrl),);
      // print("api response : $apiResponse");
      if (apiResponse.statusCode == 200) {
           var jsonString = apiResponseString.body;
           var jsonMap = jsonDecode(jsonString);
            userModel = UserModel.fromJson(jsonMap);
      }
      return userModel;
   }
    catch(Exception){
      return userModel;
    }
  }
}