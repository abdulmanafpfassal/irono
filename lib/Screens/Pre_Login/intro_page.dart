import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Screens/Pre_Login/login_page.dart';
import 'package:irono/Screens/base_screen.dart';
import 'package:irono/Utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var isLoggedIn = await sharedPreferences.getBool("isLoggedIn") ?? false;
      if (isLoggedIn == false) {
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BaseScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/vector.png"),
          SizedBox(
              height: 400.h,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/splash_image.png",
                fit: BoxFit.cover,
              )),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Professional Iron & \n Laundry Service",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Efficient ironing and laundry services for your\n professional attire needs.",
              style: GoogleFonts.inter(fontSize: 10.sp),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10.h),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorUtils().primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r), // <-- Radius
              )),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text(
            "Get Started",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
