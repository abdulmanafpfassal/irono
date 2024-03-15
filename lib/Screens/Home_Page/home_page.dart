import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Location",
              style: GoogleFonts.inter(fontSize: 10.sp),
            ),
            Text(
              "Abu Dhabi",
              style: GoogleFonts.inter(
                  fontSize: 10.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Ashfak 👋",
              style: GoogleFonts.inter(
                  fontSize: 15.sp, color: Colors.black.withOpacity(0.7)),
            ),
            Text(
              "What you are looking for today?",
              style: GoogleFonts.inter(
                  fontSize: 30.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorUtils().gray,
                  ),
                  borderRadius: BorderRadius.circular(8.r)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search what you need...",
                    hintStyle: GoogleFonts.inter(
                        color: ColorUtils().gray, fontSize: 12.sp),
                    border: InputBorder.none,
                    suffixIcon: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: ColorUtils().primary,
                          borderRadius: BorderRadius.circular(8.r)),
                    )),
              ),
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            CarouselSlider(
              items: [Image.asset("assets/images/banner1.png"),Image.asset("assets/images/banner1.png")],
              options: CarouselOptions(
                // height: 152,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal,
                padEnds: false
              ),
            )
          ],
        ),
      ),
    );
  }
}
