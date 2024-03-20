import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Provider/navigation_provider.dart';
import 'package:irono/Utils/colors.dart';
import 'package:provider/provider.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 75.h),
        child: Consumer<NavigationProvider>(
          builder: (context, state, _) {
            return Column(
              children: [
                AppBar(
                  title: Text(
                    "Booking History",
                    style:
                    GoogleFonts.inter(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  backgroundColor: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          state.setInitialBooking(BOOKING.PENDING);
                        },
                        child: Column(
                          children: [
                            Text("Pending", style: GoogleFonts.inter(
                              color: state.initialBooking == BOOKING.PENDING ? ColorUtils().primary : Colors.black
                            ),),
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          state.setInitialBooking(BOOKING.ACCEPTED);
                        },
                        child: Column(
                          children: [
                            Text("Accepted", style: GoogleFonts.inter(
                                color: state.initialBooking == BOOKING.ACCEPTED ? ColorUtils().primary : Colors.black
                            ),),
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          state.setInitialBooking(BOOKING.COMPLETED);
                        },
                        child: Column(
                          children: [
                            Text("Completed", style: GoogleFonts.inter(
                                color: state.initialBooking == BOOKING.COMPLETED ? ColorUtils().primary : Colors.black
                            ),),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            state.setInitialBooking(BOOKING.PENDING);
                          },
                          child: Container(
                            height: 2.h,
                            decoration: BoxDecoration(
                                color: state.initialBooking == BOOKING.PENDING ? ColorUtils().primary : Colors.white
                            ),
                          )),
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            state.setInitialBooking(BOOKING.ACCEPTED);
                          },
                          child: Container(
                            height: 2.h,
                            decoration: BoxDecoration(
                                color: state.initialBooking == BOOKING.ACCEPTED ? ColorUtils().primary : Colors.white
                            ),
                          )),
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            state.setInitialBooking(BOOKING.COMPLETED);
                          },
                          child: Container(
                            height: 2.h,
                            decoration: BoxDecoration(
                                color: state.initialBooking == BOOKING.COMPLETED ? ColorUtils().primary : Colors.white
                            ),
                          )),
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, state, _) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: state.initialBooking == BOOKING.PENDING ? Column(
              children: [
                serviceCard(
                    image: "assets/images/ironing_service.jpg",
                    service: "Ironing Service",
                    price: "120"),
              ],
            ) : state.initialBooking == BOOKING.ACCEPTED ? Column(
              children: [
                serviceCard(
                    image: "assets/images/ironing_service.jpg",
                    service: "Ironing Service",
                    price: "120"),

              ],
            ) : state.initialBooking == BOOKING.COMPLETED ? Column(
              children: [
                serviceCard(
                    image: "assets/images/ironing_service.jpg",
                    service: "Ironing Service",
                    price: "120"),
              ],
            ) : Container(),
          );
        }
      ),
    );
  }

  Widget serviceCard(
      {required String image, required String service, required String price}) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10.w
        // ),
        padding: EdgeInsets.all(10),
        height: 120.h,
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
            Expanded(
              child: Column(
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
                      Row(
                        children: [
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
                                color: Colors.white
                              ),
                            ),
                          ),
              
                        ],
                      )
                    ],
                  ),
                  Consumer<NavigationProvider>(
                    builder: (context, state, _) {
                      return state.initialBooking == BOOKING.ACCEPTED ? Text(
                        "Share the Code with Vendor: 98379",
                        style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                        ),
                      ) : SizedBox();
                    }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
