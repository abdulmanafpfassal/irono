import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irono/Provider/navigation_provider.dart';
import 'package:irono/Utils/colors.dart';
import 'package:provider/provider.dart';

class BottomMenuCard extends StatefulWidget {
  const BottomMenuCard({super.key});

  @override
  State<BottomMenuCard> createState() => _BottomMenuCardState();
}

class _BottomMenuCardState extends State<BottomMenuCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Consumer<NavigationProvider>(builder: (context, state, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  state.setInitialPage(MENU.HOME);
                },
                child: SvgPicture.asset(
                  "assets/images/Home.svg",
                  color: state.initialPage == MENU.HOME
                      ? ColorUtils().primary
                      : ColorUtils().icon_gray,
                )),
            InkWell(
                onTap: () {
                  state.setInitialPage(MENU.BOOKMARK);
                },
                child: SvgPicture.asset("assets/images/Icon- Outline.svg",
                    color: state.initialPage == MENU.BOOKMARK
                        ? ColorUtils().primary
                        : ColorUtils().icon_gray)),
            InkWell(
                onTap: () {
                  state.setInitialPage(MENU.NOTIFICATION);
                },
                child: SvgPicture.asset("assets/images/Union.svg",
                    color: state.initialPage == MENU.NOTIFICATION
                        ? ColorUtils().primary
                        : ColorUtils().icon_gray)),
            InkWell(
                onTap: () {
                  state.setInitialPage(MENU.MESSAGE);
                },
                child: SvgPicture.asset("assets/images/Page-1.svg",
                    color: state.initialPage == MENU.MESSAGE
                        ? ColorUtils().primary
                        : ColorUtils().icon_gray)),
          ],
        );
      }),
    );
  }
}
