import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Provider/authentication_provider.dart';
import 'package:irono/Screens/base_screen.dart';
import 'package:irono/Utils/custom.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/colors.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  OtpPage({required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpFieldController otpController = OtpFieldController();
  String? otp;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  "assets/images/logo_irono.png",
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Verification ",
                    style: GoogleFonts.poppins(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Enter your OTP   ",
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: OTPTextField(
                        hasError: true,
                        controller: otpController,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 45.w,
                        fieldStyle: FieldStyle.underline,
                        outlineBorderRadius: 15.r,
                        style: TextStyle(fontSize: 17),
                        onChanged: (pin) {},
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                          otp = pin;
                        }),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend OTP",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils().primary),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtils().primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.r), // <-- Radius
                          )),
                      onPressed: () async {
                        if (otp != null) {
                          if (otp!.length == 4) {
                            LoadingOverlay.show(context);
                            final response = await context
                                .read<AuthenticationProvider>()
                                .verifyOTP(otp.toString(), widget.phoneNumber,
                                    context);
                            LoadingOverlay.hide();
                            if (response['result']['message'] ==
                                'User Authentication Failed !') {
                              showToast("Invalid OTP. Authentication Failed");
                            } else {
                              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                              await sharedPreferences.setString("phone_number", widget.phoneNumber);
                              await sharedPreferences.setBool("isLoggedIn", true);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => BaseScreen()),
                                  (route) => false);
                            }
                          } else {
                            showToast("Otp must be of 4 digits");
                          }
                        } else if (otp == null) {
                          showToast("Otp must be of 4 digits");
                        }
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
