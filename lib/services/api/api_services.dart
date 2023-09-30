import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  /// GET API Function
  dynamic jsonRawData;
  Future<dynamic> getApi(String apiGetUrl) async{
    final response = await http.get(Uri.parse(apiGetUrl));
    try{
      jsonRawData = responseFromServer(response);
      return jsonRawData;

    } catch(e){
      throw Exception(e.toString());
    }
  }



  /// API Response
  responseFromServer(http.Response response) {
    debugPrint('${response.statusCode}');
    switch(response.statusCode)
    {
      case 200:
        return jsonRawData = jsonDecode(response.body);
      case 404:
        throw Exception('Not Found ! Response Code = ${response.statusCode}');
      case 504:
        throw Exception('Server Error! Response Code = ${response.statusCode}');
      default:
        debugPrint("${response.statusCode}");
    }
  }
}