import 'package:flutter/material.dart';
import 'package:irono/Provider/navigation_provider.dart';
import 'package:irono/Screens/Home_Page/home_page.dart';
import 'package:irono/Screens/Notification/notification_page.dart';
import 'package:irono/Screens/Order/order_status.dart';
import 'package:irono/Screens/bottom_menu_card.dart';
import 'package:provider/provider.dart';

import 'Profile/user_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (context.read<NavigationProvider>().initialPage == MENU.HOME) {
          return true;
        } else {
          context.read<NavigationProvider>().setInitialPage(MENU.HOME);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomMenuCard(),
        body: Consumer<NavigationProvider>(builder: (context, state, _) {
          return state.initialPage == MENU.HOME
              ? HomePage()
              : state.initialPage == MENU.NOTIFICATION
                  ? NotificationPage()
                  : state.initialPage == MENU.MESSAGE
                      ? UserScreen()
                      : state.initialPage == MENU.BOOKMARK
              ? BookingHistory()
              : Container();
        }),
      ),
    );
  }
}
