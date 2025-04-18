import 'dart:convert';
import 'package:http/http.dart' as http;

import '../exception/app_exceptions.dart';

class NetworkApiServices {
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  Future<dynamic> postApi(String url, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }
}