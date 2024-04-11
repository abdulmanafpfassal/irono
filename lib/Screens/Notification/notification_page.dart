import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Utils/colors.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await context.read<ServiceProvider>().fetchNotifications(context);
    });
  }

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
      body: Consumer<ServiceProvider>(builder: (context, state, _) {
        return state.notifications.isNotEmpty
            ? Container(
                margin: EdgeInsets.all(10.0),
                child: ListView.separated(
                    separatorBuilder: (context, ind) {
                      return Divider(
                        color: ColorUtils().primary.withOpacity(0.1),
                      );
                    },
                    itemCount:
                        state.notifications['result']['data']['result'].length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var notification = state.notifications['result']['data']
                          ['result'][index];
                      return Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                ColorUtils().primary.withOpacity(0.4),
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
                                  "New notification received",
                                  style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(notification['body'].toString(),
                                    style: GoogleFonts.inter(fontSize: 11.sp)),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              )
            : SizedBox();
      }),
    );
  }
}
