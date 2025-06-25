import 'dart:convert';
import 'package:api_integration/data/model/List_model.dart';
import 'package:api_integration/data/model/multiple_post_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiServices {
  Future<List<dynamic>> getCart() async {
    try {
      Uri url = Uri.parse("https://dummyjson.com/carts");
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      print("status code ${response.statusCode}");
      if (response.statusCode == 200) {
        print(response.body);
        final decoded = json.decode(response.body);
        return decoded["carts"];
      }
    } catch (ex) {
      debugPrint(ex.toString());
      return [];
    }
    return [];
  }

  Future<List<MultiplePostModel>?> getPostWithModel() async {
    try {
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer your_token_here', // Uncomment if needed
        },
      );
      if (response.statusCode == 200) {
        List<MultiplePostModel> model = List<MultiplePostModel>.from(json
            .decode(response.body)
            .map((e) => MultiplePostModel.fromJson(e)));
        return model;
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }

    return null;
  }

  Future<List<ListModel>?> getListData() async {
    try {
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        debugPrint("dta is ${response.body}");
        List<ListModel> model = List<ListModel>.from(
            json.decode(response.body).map((e) => ListModel.fromJson(e)));
        return model;
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
