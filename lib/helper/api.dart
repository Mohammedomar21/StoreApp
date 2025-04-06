
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api{
  Future<dynamic> get({required String url ,@required String? token}) async
  {
    log('hvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
    Map<String,String> headers={};
    headers.addAll({
      'Content-Type':'application/x-www-urlencoded'
    });
    if(token !=null) {
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    log('haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah');

    http.Response response=await http.get(Uri.parse(url),);
    log(response.statusCode as String);
    if(response.statusCode==200)
      {
        
        return jsonDecode(response.body);
      }
    else
      {
        log('hmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
        throw Exception('there is problem with status code ${response.statusCode}');
      }

  }
  Future<dynamic>post( {required String url,@required dynamic body,@required String? token }) async{
    Map<String,String> headers={};
    if(token !=null) {
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    http.Response response=  await http.post(Uri.parse(url),
        body: body ,
        headers:headers
        );
    if(response.statusCode==200) {
      return jsonDecode(response.body);
    } else
    {
      throw Exception('there is problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }

  }

  Future<dynamic>put( {required String url,@required dynamic body,@required String? token }) async{
    Map<String,String> headers={};
    headers.addAll({
      'Content-Type':'application/x-www-urlencoded'
    });
    if(token !=null) {
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    http.Response response=  await http.post(Uri.parse(url),
        body: body ,
        headers:headers
    );
    if(response.statusCode==200) {
      return jsonDecode(response.body);
    } else
    {
      throw Exception('there is problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }

  }
}