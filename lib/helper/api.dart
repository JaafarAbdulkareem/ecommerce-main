import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/constant/name_constant.dart';

class Api {
  Future<dynamic> getProduct({required String uri}) async {
    try {
      http.Response response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'oops, some error statuscode ${response.statusCode} the message ${jsonDecode(response.body)}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List> getCategoryName() async {
    http.Response response = await http.get(Uri.parse(AppApi.categoryPath));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'oops, some error statuscode ${response.statusCode} the message ${jsonDecode(response.body)}');
    }
  }
}
