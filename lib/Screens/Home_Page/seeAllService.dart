import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Provider/authentication_provider.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Screens/service/service_details.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';

class SeeAllService extends StatefulWidget {
  const SeeAllService({super.key});

  @override
  State<SeeAllService> createState() => _SeeAllServiceState();
}

class _SeeAllServiceState extends State<SeeAllService> {

   @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 0), () async {
    //   LoadingOverlay.show(context);
    //   await context.read<ServiceProvider>().fetchServiceDetails();
    //   LoadingOverlay.hide();
    // });
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
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
                    Text(
                      service,
                      style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Providers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<AuthenticationProvider>(builder: (context, state, _) {
                return state.loginResponse.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                            state
                                .loginResponse["result"]['data']
                                    ["service_providers"]
                                .length,
                            (index) => serviceCard(
                                image: state.loginResponse['result']['data']
                                    ["service_providers"][index]['image'],
                                service: state.loginResponse['result']['data']
                                    ["service_providers"][index]['name'],
                                price: "130",
                                id: state.loginResponse['result']['data']
                                    ['service_providers'][index]['id']),
                          ),
                        ),
                      )
                    : SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }
}
