import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:irono/Network/webService.dart';
import 'package:irono/Provider/authentication_provider.dart';
import 'package:irono/Utils/network_urls.dart';
import 'package:provider/provider.dart';

class LoginRepo {
  ApiService _service = ApiService();

  Future<Map<String, dynamic>> sendOtp(BuildContext context) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      print(context
          .read<AuthenticationProvider>()
          .phoneNumber
          .toString()
          .split("+")[1]
          .toString());

      var body = jsonEncode({
        "phone": context
            .read<AuthenticationProvider>()
            .phoneNumber
            .toString()
            .split("+")[1]
            .toString()
      });

      final response =
          await _service.postResponse(NetworkUrls.login_url, body, headers);
      log("message" + response.statusCode.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        responseData = responseBody;
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> signUp(BuildContext context, var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.sign_up, jsonEncode(body), headers);
      log("message" + response.body.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        responseData = responseBody;
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }



 Future<Map<String, dynamic>> otpVerification(BuildContext context, var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.otp_verification, jsonEncode(body), headers);
      log("message" + response.body.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        responseData = responseBody;
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }



}
