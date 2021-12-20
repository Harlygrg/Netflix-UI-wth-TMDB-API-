import 'package:flutter/material.dart';
import 'package:netflix_clone/actions/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API_Manager {
  String? onchanged;

  API_Manager({this.onchanged});

  String searchUrl() {
    String searchUrl =
        "https://api.themoviedb.org/3/search/movie?api_key=b691875b6959a2995d4d8bbb9e13c8be&language=en-US&query=${onchanged}&page=1&include_adult=false";
    return searchUrl;
  }

  Future<UserModel> createData({String? query}) async {
    var apiResponse = await http.get(
      Uri.parse(onchanged == null || onchanged!.isEmpty ? apiUrl : searchUrl()),
    );
    if (apiResponse.statusCode == 200) {
      var str = apiResponse.body;
      final result = jsonDecode(str);
      var valuees = UserModel.fromJson(result);
      return valuees;
      // if(query!=null){
      //  return UserModel.fromJson(result).results!.where((element) => element.title!.toLowerCase().contains(query.toLowerCase()));
      // }
    } else {
      throw Exception("Failed to load movies image");
    }
  }
}
