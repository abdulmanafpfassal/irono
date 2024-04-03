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

  signUp(fname, lname, email, phoneNumber, BuildContext context) async {
    var body = {
      "first_name": fname,
      "last_name": lname,
      "email": email,
      "phone": phoneNumber
    };
    var reponse = await _loginRepo.signUp(context, body);
  }

  verifyOTP(otp, phoneNumber, BuildContext context) async {
    var body = {"otp": otp, "phone": phoneNumber};
    var reponse = await _loginRepo.otpVerification(context, body);
  }
}
