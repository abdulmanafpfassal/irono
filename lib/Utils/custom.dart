import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[600],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}



class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: [
          ModalBarrier(
            dismissible: false,
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
