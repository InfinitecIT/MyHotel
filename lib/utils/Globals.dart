import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhotel/models/GetHotelRoomsResp.dart';

class Globals {
  static List<Rooms> rooms = [];
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Color primaryColor = Colors.black;
  static Color backgroundColor = Colors.white;
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static showPage(page, {Function()? callback}) {
    Route route = CupertinoPageRoute<bool>(builder: (BuildContext context) => page); //IOS show Page transition animation
    Navigator.push(navigatorKey.currentContext!, route).then(
      (flag) {
        if (callback != null) {
          callback();
        }
      },
    );
  }

  static openAlert(dynamic dialog) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  static replacePage(page, {Function()? callback}) {
    Route route = CupertinoPageRoute<bool>(builder: (BuildContext context) => page); //IOS show Page transition animation
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      route,
      (Route<dynamic> route) => false,
    ).then((flag) {
      if (callback != null) {
        callback();
      }
    });
  }

  static pop({int? count = 1}) {
    for (int i = 0; i < count!; i++) {
      Navigator.pop(Globals.navigatorKey.currentContext!);
    }
  }
}
