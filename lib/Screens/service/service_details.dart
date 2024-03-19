import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/colors.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({super.key});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset("assets/images/laundry_service.jpg"),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r)),
                ),
                Container(
                  height: 160.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 3.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Colors.green),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 13.sp,
                                ),
                                Text(
                                  "4.8",
                                  style: GoogleFonts.inter(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            "Cloth Ironing \nService",
                            style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shirt",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: 40.w,
                            height: 40.h,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: ColorUtils().primary,
                                borderRadius: BorderRadius.circular(8.r)),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "0",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: 40.w,
                            height: 40.h,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: ColorUtils().primary,
                                borderRadius: BorderRadius.circular(8.r)),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trousers",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: 40.w,
                            height: 40.h,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: ColorUtils().primary,
                                borderRadius: BorderRadius.circular(8.r)),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "0",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: 40.w,
                            height: 40.h,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: ColorUtils().primary,
                                borderRadius: BorderRadius.circular(8.r)),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Blazer",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: 40.w,
                            height: 40.h,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: ColorUtils().primary,
                                borderRadius: BorderRadius.circular(8.r)),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "0",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            width: 40.w,
                            height: 40.h,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: ColorUtils().primary,
                                borderRadius: BorderRadius.circular(8.r)),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Extra Notes",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorUtils().gray.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Notes here...",
                        hintStyle: GoogleFonts.inter(
                            color: ColorUtils().gray, fontSize: 12.sp),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "PickUp Date",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          "Mar 22",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )),
                        decoration: BoxDecoration(
                            color: ColorUtils().primary,
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          "Mar 23",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: ColorUtils().primary),
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          "Mar 24",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: ColorUtils().primary),
                            borderRadius: BorderRadius.circular(8.r)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "PickUp Time",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          "06:00 PM",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )),
                        decoration: BoxDecoration(
                            color: ColorUtils().primary,
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          "07:00 PM",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: ColorUtils().primary),
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          "08:00 PM",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: ColorUtils().primary),
                            borderRadius: BorderRadius.circular(8.r)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Total: AED 550",
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            height: 40.h,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtils().primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r), // <-- Radius
                  )),
              onPressed: () {},
              child: Text(
                "Book Now",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
