import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Provider/authentication_provider.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Screens/Home_Page/categoryWiseProviders.dart';
import 'package:irono/Screens/Home_Page/searchResults.dart';
import 'package:irono/Screens/Home_Page/seeAllService.dart';
import 'package:irono/Screens/service/service_details.dart';
import 'package:irono/Utils/colors.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await context.read<ServiceProvider>().fetchHomePageDatas(context);
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          child: Consumer<AuthenticationProvider>(builder: (context, state, _) {
            return state.loginResponse.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello ${state.loginResponse["result"]["data"]["user_name"].toString()} 👋",
                        style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            color: Colors.black.withOpacity(0.7)),
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
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: "Search what you need...",
                              hintStyle: GoogleFonts.inter(
                                  color: ColorUtils().gray, fontSize: 12.sp),
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                onTap: () {
                                  if (searchController.text.isEmpty) {
                                    showToast("Enter something to search");
                                  } else {
                                    context
                                        .read<ServiceProvider>()
                                        .search(context, searchController.text);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchResults()));
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorUtils().primary,
                                      borderRadius: BorderRadius.circular(8.r)),
                                ),
                              )),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      Consumer<AuthenticationProvider>(
                          builder: (context, state, _) {
                        return state.loginResponse.isNotEmpty
                            ? CarouselSlider(
                                // items: [
                                //   Image.asset("assets/images/banner1.png"),
                                //   Image.asset("assets/images/banner1.png")
                                // ],
                                items: List.generate(
                                    state
                                        .loginResponse['result']["data"]
                                            ["banners"]
                                        .length,
                                    (index) => Image.network(state
                                        .loginResponse["result"]["data"]
                                            ["banners"][index]["image"]
                                        .toString())),
                                options: CarouselOptions(
                                    // height: 152,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    aspectRatio: 16 / 9,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    viewportFraction: 0.8,
                                    scrollDirection: Axis.horizontal,
                                    padEnds: false),
                              )
                            : SizedBox();
                      }),
                      Container(
                        child: Consumer<AuthenticationProvider>(
                            builder: (context, state, _) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                state
                                    .loginResponse["result"]['data']
                                        ["service_categories"]
                                    .length,
                                (index) => InkWell(
                                  onTap: () {
                                    context
                                        .read<ServiceProvider>()
                                        .categoryBasedProviders(
                                            context,
                                            state.loginResponse["result"]
                                                        ['data']
                                                    ["service_categories"]
                                                [index]["id"]);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CategoryWiseProviders()));
                                  },
                                  child: Container(
                                    width: 100.w,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100.h,
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              // backgroundColor: ColorUtils().pink,
                                              radius: 28.r,
                                              child: Container(
                                                  margin: EdgeInsets.all(15),
                                                  child: Image.network(state
                                                                  .loginResponse[
                                                              "result"]['data']
                                                          ["service_categories"]
                                                      [index]["image"])),
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            Text(
                                              state.loginResponse["result"]
                                                          ['data']
                                                      ["service_categories"]
                                                  [index]["name"],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: GoogleFonts.inter(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
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
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SeeAllService()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.5))),
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Consumer<AuthenticationProvider>(
                          builder: (context, state, _) {
                        return state.loginResponse.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    state
                                        .loginResponse["result"]['data']
                                            ["service_providers"]
                                        .length,
                                    (index) => serviceCard(
                                        image: state.loginResponse['result']
                                                ['data']["service_providers"]
                                            [index]['image'],
                                        service: state.loginResponse['result']
                                                ['data']["service_providers"]
                                            [index]['name'],
                                        price: "130",
                                        id: state.loginResponse['result']
                                                ['data']['service_providers']
                                            [index]['id']),
                                  ),
                                ),
                              )
                            : SizedBox();
                      })
                    ],
                  )
                : SizedBox();
          }),
        ),
      ),
    );
  }

  Widget serviceCard(
      {required String image,
      required String service,
      required String price,
      required var id}) {
    return InkWell(
      onTap: () {
        context.read<ServiceProvider>().setSelectedId(id);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ServiceDetailsPage()));
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10.w
        // ),
        // padding: EdgeInsets.all(10),
        height: 110.h,
        width: 220.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          children: [
            Container(
              width: 130.w,
              height: 130.h,
              // child: Image.network(
              //   image,
              //   fit: BoxFit.cover,
              //   headers: {
              //     "X-Openerp-Session-id":
              //         context.read<ServiceProvider>().getSessionCookie()
              //   },
              // )
              child: FutureBuilder<String?>(
                future: context.read<ServiceProvider>().getSessionCookie(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Return a placeholder or loading indicator while waiting for the session cookie
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Handle error case
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Retrieve the session cookie from the snapshot data
                    String? sessionCookie = snapshot.data;
                    log("session cookier is " + sessionCookie!);
                    // If sessionCookie is null, handle this case according to your app logic

                    // Pass sessionCookie as a header to Image.network
                    return Image.network(
                      image,
                      fit: BoxFit.cover,
                      headers: {
                        "X-Openerp-Session-id": sessionCookie ?? '',
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.star,
                  //       color: Colors.yellow,
                  //     ),
                  //     SizedBox(
                  //       width: 5.w,
                  //     ),
                  //     Text(
                  //       "4.8",
                  //       style: GoogleFonts.inter(
                  //         fontSize: 11.sp,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 5.w,
                  //     ),
                  //     Text(
                  //       "(48)",
                  //       style: GoogleFonts.inter(
                  //           fontSize: 11.sp,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.black.withOpacity(0.7)),
                  //     ),
                  //   ],
                  // ),

                  Text(
                    service,
                    style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Price Starts From",
                  //       style: GoogleFonts.inter(
                  //           fontSize: 11.sp,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.black.withOpacity(0.7)),
                  //     ),
                  //     SizedBox(
                  //       height: 7.h,
                  //     ),
                  //     // Container(
                  //     //   padding:
                  //     //       EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  //     //   decoration: BoxDecoration(
                  //     //       borderRadius: BorderRadius.circular(8.r),
                  //     //       color: Colors.green),
                  //     //   child: Text(
                  //     //     "AED ${price}",
                  //     //     style: GoogleFonts.inter(
                  //     //         fontSize: 11.sp,
                  //     //         fontWeight: FontWeight.w600,
                  //     //         color: Colors.white),
                  //     //   ),
                  //     // )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
