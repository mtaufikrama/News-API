import 'dart:convert';

import 'package:newsapi/object/apinewsindo.dart';
import 'package:http/http.dart' as http;

class API {
  Future<ApiNewsIndoCategory> apiNewsIndoCategory() async {
    Uri apiNewsIndo = Uri.https('api-berita-indonesia.vercel.app');
    final response = await http.get(apiNewsIndo);
    return ApiNewsIndoCategory.fromJson(jsonDecode(response.body));
  }

  Future<ApiNewsIndo> apiNewsIndo(String url) async {
    Uri apiNewsIndo = Uri.parse(url);
    final response = await http.get(apiNewsIndo);
    return ApiNewsIndo.fromJson(jsonDecode(response.body));
  }

  // Future<ApiNewsIndo> bible(String url) async {
  //   Uri apiNewsIndo = Uri.parse(url);
  //   final response = await http.get(apiNewsIndo);
  //   return ApiNewsIndo.fromJson(jsonDecode(response.body));
  // }
}
