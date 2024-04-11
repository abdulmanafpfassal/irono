import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';

import '../../Utils/colors.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({super.key});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      LoadingOverlay.show(context);
      await context.read<ServiceProvider>().fetchServiceDetails();
      LoadingOverlay.hide();
    });
  }

  TextEditingController notesController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ServiceProvider>(builder: (context, state, _) {
        return state.serviceDetails.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(state.serviceDetails["result"]
                                    ["data"]["image"]
                                .toString()),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken),
                          )),
                          width: MediaQuery.of(context).size.width,
                          height: 200.h,

                          // child: ClipRRect(
                          //   child: Image.network(state.serviceDetails["result"]["data"]
                          //           ["image"]
                          //       .toString()),
                          //   borderRadius: BorderRadius.only(
                          //       bottomLeft: Radius.circular(10.r),
                          //       bottomRight: Radius.circular(10.r)),
                          // ),
                        ),
                        Container(
                          height: 160.h,
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 30.h),
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
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 5.w, vertical: 3.h),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(8.r),
                                  //       color: Colors.green),
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: [
                                  //       Icon(
                                  //         Icons.star,
                                  //         color: Colors.white,
                                  //         size: 13.sp,
                                  //       ),
                                  //       Text(
                                  //         "4.8",
                                  //         style: GoogleFonts.inter(
                                  //             fontSize: 11.sp,
                                  //             fontWeight: FontWeight.w600,
                                  //             color: Colors.white),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                               
                               
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    state.serviceDetails["result"]["data"]
                                            ["name"]
                                        .toString(),
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
                    state.serviceDetails["result"]["data"]["about"] == false
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
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
                          )
                        : SizedBox(),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Trousers",
                          //       style: GoogleFonts.inter(
                          //         fontSize: 13.sp,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     Row(
                          //       children: [
                          //         Container(
                          //           margin: EdgeInsets.symmetric(vertical: 5.0),
                          //           width: 40.w,
                          //           height: 40.h,
                          //           child: Icon(
                          //             Icons.remove,
                          //             color: Colors.white,
                          //           ),
                          //           decoration: BoxDecoration(
                          //               color: ColorUtils().primary,
                          //               borderRadius: BorderRadius.circular(8.r)),
                          //         ),
                          //         SizedBox(
                          //           width: 7.w,
                          //         ),
                          //         Text(
                          //           "0",
                          //           style: GoogleFonts.inter(
                          //             fontSize: 14.sp,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 7.w,
                          //         ),
                          //         Container(
                          //           margin: EdgeInsets.symmetric(vertical: 5.0),
                          //           width: 40.w,
                          //           height: 40.h,
                          //           child: Icon(
                          //             Icons.add,
                          //             color: Colors.white,
                          //           ),
                          //           decoration: BoxDecoration(
                          //               color: ColorUtils().primary,
                          //               borderRadius: BorderRadius.circular(8.r)),
                          //         )
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Blazer",
                          //       style: GoogleFonts.inter(
                          //         fontSize: 13.sp,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     Row(
                          //       children: [
                          //         Container(
                          //           margin: EdgeInsets.symmetric(vertical: 5.0),
                          //           width: 40.w,
                          //           height: 40.h,
                          //           child: Icon(
                          //             Icons.remove,
                          //             color: Colors.white,
                          //           ),
                          //           decoration: BoxDecoration(
                          //               color: ColorUtils().primary,
                          //               borderRadius: BorderRadius.circular(8.r)),
                          //         ),
                          //         SizedBox(
                          //           width: 7.w,
                          //         ),
                          //         Text(
                          //           "0",
                          //           style: GoogleFonts.inter(
                          //             fontSize: 14.sp,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 7.w,
                          //         ),
                          //         Container(
                          //           margin: EdgeInsets.symmetric(vertical: 5.0),
                          //           width: 40.w,
                          //           height: 40.h,
                          //           child: Icon(
                          //             Icons.add,
                          //             color: Colors.white,
                          //           ),
                          //           decoration: BoxDecoration(
                          //               color: ColorUtils().primary,
                          //               borderRadius: BorderRadius.circular(8.r)),
                          //         )
                          //       ],
                          //     )
                          //   ],
                          // ),

                          state.services.length > 0
                              ? ListView.builder(
                                  itemCount: state.services.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var serviceData = state.services[index];
                                    log("any chnage here" +
                                        serviceData.toString());
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                serviceData['name'].toString(),
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "AED " +
                                                    serviceData['price']
                                                        .toString(),
                                                style: GoogleFonts.inter(
                                                  fontSize: 13.sp,
                                                  color: Colors.grey.shade400,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (serviceData["count"] !=
                                                    "0") {
                                                  var count = int.parse(
                                                          serviceData[
                                                              'count']) -
                                                      1;
                                                  context
                                                      .read<ServiceProvider>()
                                                      .updateCount(
                                                          index, count);
                                                }
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5.0),
                                                width: 40.w,
                                                height: 40.h,
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: ColorUtils().primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Text(
                                              serviceData['count'].toString(),
                                              style: GoogleFonts.inter(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var count = int.parse(
                                                        serviceData['count']) +
                                                    1;
                                                context
                                                    .read<ServiceProvider>()
                                                    .updateCount(index, count);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5.0),
                                                width: 40.w,
                                                height: 40.h,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: ColorUtils().primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r)),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                )
                              : SizedBox(
                                  child:
                                      Text("No services currently available"),
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
                              controller: notesController,
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
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 40.h,
                          //       padding: EdgeInsets.symmetric(horizontal: 5.w),
                          //       child: Center(
                          //           child: Text(
                          //         "Mar 22",
                          //         style: GoogleFonts.inter(
                          //             color: Colors.white,
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.w500),
                          //       )),
                          //       decoration: BoxDecoration(
                          //           color: ColorUtils().primary,
                          //           borderRadius: BorderRadius.circular(8.r)),
                          //     ),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     Container(
                          //       height: 40.h,
                          //       padding: EdgeInsets.symmetric(horizontal: 5.w),
                          //       child: Center(
                          //           child: Text(
                          //         "Mar 23",
                          //         style: GoogleFonts.inter(
                          //             color: Colors.black,
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.w500),
                          //       )),
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border:
                          //               Border.all(color: ColorUtils().primary),
                          //           borderRadius: BorderRadius.circular(8.r)),
                          //     ),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     Container(
                          //       height: 40.h,
                          //       padding: EdgeInsets.symmetric(horizontal: 5.w),
                          //       child: Center(
                          //           child: Text(
                          //         "Mar 24",
                          //         style: GoogleFonts.inter(
                          //             color: Colors.black,
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.w500),
                          //       )),
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border:
                          //               Border.all(color: ColorUtils().primary),
                          //           borderRadius: BorderRadius.circular(8.r)),
                          //     )
                          //   ],
                          // ),

                          Container(
                            height: 45,
                            child: TextField(
                              controller: timeController,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                ).then((selectedDate) {
                                  // After selecting the date, display the time picker.
                                  if (selectedDate != null) {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((selectedTime) {
                                      // Handle the selected date and time here.
                                      if (selectedTime != null) {
                                        DateTime selectedDateTime = DateTime(
                                          selectedDate.year,
                                          selectedDate.month,
                                          selectedDate.day,
                                          selectedTime.hour,
                                          selectedTime.minute,
                                        );
                                        print(
                                            selectedDateTime); // You can use the selectedDateTime as needed.
                                        timeController.text = context
                                            .read<ServiceProvider>()
                                            .formattedDateTime(
                                                selectedDateTime);
                                        context
                                            .read<ServiceProvider>()
                                            .setSelectedDateTime(
                                                selectedDateTime);
                                        setState(() {});
                                      }
                                    });
                                  }
                                });
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: "Choose Date"),
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorUtils().gray.withOpacity(0.3),
                                )),
                          ),

                          SizedBox(
                            height: 10.h,
                          ),
                          // Text(
                          //   "PickUp Time",
                          //   style: GoogleFonts.inter(
                          //     fontSize: 13.sp,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 7.h,
                          // ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       height: 40.h,
                          //       padding: EdgeInsets.symmetric(horizontal: 5.w),
                          //       child: Center(
                          //           child: Text(
                          //         "06:00 PM",
                          //         style: GoogleFonts.inter(
                          //             color: Colors.white,
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.w500),
                          //       )),
                          //       decoration: BoxDecoration(
                          //           color: ColorUtils().primary,
                          //           borderRadius: BorderRadius.circular(8.r)),
                          //     ),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     Container(
                          //       height: 40.h,
                          //       padding: EdgeInsets.symmetric(horizontal: 5.w),
                          //       child: Center(
                          //           child: Text(
                          //         "07:00 PM",
                          //         style: GoogleFonts.inter(
                          //             color: Colors.black,
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.w500),
                          //       )),
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border:
                          //               Border.all(color: ColorUtils().primary),
                          //           borderRadius: BorderRadius.circular(8.r)),
                          //     ),
                          //     SizedBox(
                          //       width: 10.w,
                          //     ),
                          //     Container(
                          //       height: 40.h,
                          //       padding: EdgeInsets.symmetric(horizontal: 5.w),
                          //       child: Center(
                          //           child: Text(
                          //         "08:00 PM",
                          //         style: GoogleFonts.inter(
                          //             color: Colors.black,
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.w500),
                          //       )),
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border:
                          //               Border.all(color: ColorUtils().primary),
                          //           borderRadius: BorderRadius.circular(8.r)),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : SizedBox();
      }),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<ServiceProvider>(builder: (context, state, _) {
            return state.price != null
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Total: AED ${state.price}",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : SizedBox();
          }),
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
              onPressed: () {
                context
                    .read<ServiceProvider>()
                    .confirmBooking(context, notesController.text);
              },
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
