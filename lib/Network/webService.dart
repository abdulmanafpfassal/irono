import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Utils/network_urls.dart';
import 'baseService.dart';

class ApiService extends BaseService {
  @override
  Future deleteResponse(String url, var headers) async {
    dynamic responseJson;
    try {
      responseJson =
      await http.delete(Uri.parse(NetworkUrls.Basic_Url + url), headers: headers);
    } on Exception {
      throw UnimplementedError();
    }
    return responseJson;
  }

  @override
  Future getResponse(String url, headers) async {
    dynamic responseJson;
    try {
      responseJson =
      await http.get(Uri.parse(NetworkUrls.Basic_Url + url), headers: headers);
      if(kDebugMode){
        log("RESPONSE FROM " + url + "\n" + responseJson.body.toString());
      }
    } on Exception {
      throw UnimplementedError();
    }
    return responseJson;
  }


  @override
  Future patchResponse(String url, body, headers) async {
    var responseJson;
    try {
      final response = await http.patch(Uri.parse(NetworkUrls.Basic_Url + url),
          body: body, headers: headers);
      if (response.statusCode == 200) {
        responseJson = response;
      } else {
        responseJson = "{'message': 'error'}";
      }
    } on Exception {
      throw UnimplementedError();
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, body, headers) async {
    var responseJson;
    try {
      log("message" + url + " " + body.toString() + " " + headers.toString());
      final response = await http.post(Uri.parse(NetworkUrls.Basic_Url + url),
          body: body, headers: headers);
      responseJson = response;

    } on Exception {
      throw UnimplementedError();
    }
    return responseJson;
  }

  @override
  Future post(String url, headers) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(NetworkUrls.Basic_Url + url),
          headers: headers);

      responseJson = response;
    } on Exception {
      throw UnimplementedError();
    }
    return responseJson;
  }

  @override
  Future putResponse(String url, body, headers) async {
    var responseJson;
    try {
      final response = await http.put(Uri.parse(NetworkUrls.Basic_Url + url),
          body: body, headers: headers);

      responseJson = response;
    } on Exception {
      throw UnimplementedError();
    }
    return responseJson;
  }

  @override
  Future put(String url, headers) async {
    var responseJson;
    try {
      final response = await http.put(Uri.parse(NetworkUrls.Basic_Url + url),
          headers: headers);

      responseJson = response;
    } on Exception {
      throw UnimplementedError();
    }
    return responseJson;
  }

}