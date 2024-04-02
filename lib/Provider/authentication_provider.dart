import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:irono/Repository/login_repo.dart';

class AuthenticationProvider with ChangeNotifier {

  LoginRepo _loginRepo = LoginRepo();

  dynamic loginResponse;

  String phoneNumber = "";

  setPhoneNumber(String number) {
    phoneNumber = number;
    notifyListeners();
  }

  doLogin(BuildContext context) async {
    loginResponse = await _loginRepo.sendOtp(context);
    log("the response body is " + loginResponse.toString());
    notifyListeners();
  }

}