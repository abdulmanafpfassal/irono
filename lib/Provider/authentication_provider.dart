import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Repository/login_repo.dart';
import 'package:provider/provider.dart';

class AuthenticationProvider with ChangeNotifier {
  LoginRepo _loginRepo = LoginRepo();
  dynamic userId;
  Map loginResponse = {};
  Map profileDetails = {};
  String phoneNumber = "";

  setPhoneNumber(String number) {
    phoneNumber = number;
    notifyListeners();
  }

  fetchProfileDetails() async {
    var body = {"user": userId};
    profileDetails = await _loginRepo.profileDetails(body);
    notifyListeners();
  }

  updateProfile(BuildContext context, name, email, phone) async {
    var body = {"user": userId, "name": name, "email": email, "phone": phone};
    profileDetails = await _loginRepo.updateProfile(body);
    await context.read<ServiceProvider>().fetchHomePageDatas(context);
  }

  setUserId(id) {
    this.userId = id;
  }

  Future<Map> doLogin(BuildContext context) async {
    loginResponse = await _loginRepo.sendOtp(context);
    log("the response body is " + loginResponse.toString());
    return loginResponse;
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
    var response = await _loginRepo.otpVerification(context, body);
    print("response after verifyiong otp " +
        response.toString() +
        "\n" +
        body.toString());
    loginResponse = response;
    notifyListeners();
    return loginResponse;
  }

  setLoginResponse(var data) {
    this.loginResponse = data;
    notifyListeners();
  }
}
