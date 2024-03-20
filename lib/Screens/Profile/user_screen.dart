import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Screens/Pre_Login/login_page.dart';
import 'package:irono/Utils/colors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style:
              GoogleFonts.inter(fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35.r,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Jack James")
                ],
              ),
            ),
            Divider(
              color: ColorUtils().primary.withOpacity(0.1),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Profile",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11.sp,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Terms & Conditions",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11.sp,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Privacy Policy",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11.sp,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Contact Us",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11.sp,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Send Feedback",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11.sp,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Logout",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 11.sp,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 20.h,
        child: Center(
          child: Text(
            "v1.0.0",
            style: GoogleFonts.inter(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
