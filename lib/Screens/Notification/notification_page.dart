import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Utils/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Notification",
          style:
              GoogleFonts.inter(fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.separated(
          separatorBuilder: (context, ind){
            return Divider(color: ColorUtils().primary.withOpacity(0.1),);
          },
            itemCount: 10,
            itemBuilder: (context, index) {
          return Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorUtils().primary.withOpacity(0.4),
                radius: 25.r,
                child: SvgPicture.asset(
                  "assets/images/Union.svg",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Service Request Accepted",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                    Text("The service for laundry was accepted by abc company",
                        style: GoogleFonts.inter(fontSize: 11.sp)),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
