import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, required String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final response = await http.get(Uri.parse(url), headers: headers);
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'GET failed: ${response.statusCode} - ${response.body}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log('POST Status: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'POST failed: ${response.statusCode} - ${response.body}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    log(body.toString());

    final response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,

    );

    log('PUT Status: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'PUT failed: ${response.statusCode} - ${response.body}',
      );
    }
  }
}
