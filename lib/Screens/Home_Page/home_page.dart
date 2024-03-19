import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Screens/service/service_details.dart';
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
        // leading: const Icon(Icons.menu),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Location",
              style: GoogleFonts.inter(fontSize: 11.sp),
            ),
            Row(
              children: [
                Text(
                  "Abu Dhabi",
                  style: GoogleFonts.inter(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_drop_down_outlined)
              ],
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: SingleChildScrollView(
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
                items: [
                  Image.asset("assets/images/banner1.png"),
                  Image.asset("assets/images/banner1.png")
                ],
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
                    padEnds: false),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorUtils().pink,
                          radius: 28.r,
                          child: Container(
                              margin: EdgeInsets.all(15),
                              child: Image.asset("assets/images/iron.png")),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Ironing",
                          style: GoogleFonts.inter(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorUtils().blue,
                          radius: 28.r,
                          child: Container(
                              margin: EdgeInsets.all(15),
                              child: Image.asset("assets/images/laundry.png")),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Laundry",
                          style: GoogleFonts.inter(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(35.r)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 28.r,
                            child: Container(
                                margin: EdgeInsets.all(15),
                                child: Icon(Icons.arrow_forward)),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "See All",
                          style: GoogleFonts.inter(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Service Provider",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.5))),
                    child: Row(
                      children: [
                        Text(
                          "See All",
                          style: GoogleFonts.inter(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 11.sp,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    serviceCard(
                        image: "assets/images/ironing_service.jpg",
                        service: "Ironing Service",
                        price: "120"),
                    SizedBox(
                      width: 10.w,
                    ),
                    serviceCard(
                        image: "assets/images/laundry_service.jpg",
                        service: "Laundry Service",
                        price: "200"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceCard(
      {required String image, required String service, required String price}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ServiceDetailsPage()));
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10.w
        // ),
        padding: EdgeInsets.all(10),
        height: 110.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          children: [
            Container(
                width: 130.w,
                height: 130.h,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "4.8",
                      style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "(48)",
                      style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                  ],
                ),
                Text(
                  service,
                  style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price Starts From",
                      style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.green),
                      child: Text(
                        "AED ${price}",
                        style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
