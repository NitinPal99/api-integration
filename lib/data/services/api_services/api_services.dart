import 'dart:convert';
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
}
