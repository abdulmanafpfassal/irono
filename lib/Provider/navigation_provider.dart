import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {

  MENU initialPage = MENU.HOME;

  setInitialPage(MENU page){
    initialPage = page;
    notifyListeners();
  }

}

enum MENU { HOME, BOOKMARK, NOTIFICATION, MESSAGE }