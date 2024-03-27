import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'Base/POST.dart';
import 'ErrorResponse/ErrorResponse.dart';

/*
flutter pub add http;
flutter pub add shared_preferences;
flutter pub add crypto;
flutter pub add json_serializable;
flutter pub add build_runner;
flutter pub get;
flutter pub run build_runner watch --delete-conflicting-outputs;
*/

class HttpAPI {
  static Duration REQUEST_TIMEOUT_TIME = Duration(seconds: 30);
  // var ApiUrl = "localhost";
  var ApiUrl = "myhotel.iworkr.app";
  // var ApiUrl = "192.168.206.115";

  static int lastTransactionTime = 0;

  var guestAuthKey = "GUESTAUTHKEY";
  static var authKey = "AUTHKEY";

  Stopwatch stopWatch = Stopwatch();

  HttpAPI() {
    // guestAuthKey = Globals.prefs.getString("guestAuthKey") ?? "GUESTAUTHKEY";
  }

  //--- POST METHODS ---\\\

  FutureOr<HttpResponse?> postAUTH(dynamic jsonIn, String method, {String? authKey}) async {
    String jsonInEncoded = "";
    if (jsonIn is Map<String, dynamic>) {
      jsonInEncoded = json.encode(jsonIn);
    } else {
      jsonInEncoded = jsonIn;
    }

    var urlPath = "/api/" + method;

    stopWatch.reset();

    //Headers
    Map<String, String> headers = {"Content-Type": "iworkr/auth", "Authorization": authKey ?? ""};

    Map<String, String> queries = {};

    return await POST.execute(jsonInEncoded, ApiUrl, urlPath, headers, queries, stopWatch);
  }

  FutureOr<HttpResponse?> postNOAUTH(dynamic jsonIn, String method) async {
    final String path = '/internal/$method';
    stopWatch.reset();
    String jsonInEncoded = "";
    if (jsonIn is Map<String, dynamic>) {
      jsonInEncoded = json.encode(jsonIn);
    } else {
      jsonInEncoded = jsonIn;
    }
    //Headers
    Map<String, String> headers = {
      "Content-Type": "myhotel/login",
      "Accept": "application/json",
      "Authorization": guestAuthKey,
    };

    Map<String, String> queries = {};
    if (kDebugMode) {
      queries["debug"] = "true";
    }

    return await POST.execute(jsonInEncoded, ApiUrl, path, headers, queries, stopWatch);
  }
}

class HttpResponse {
  int? statusCode;
  dynamic body;
  ErrorResponse? errorResponse;

  HttpResponse({this.statusCode, String? body, this.errorResponse}) {
    try {
      this.body = jsonDecode(body ?? "");
    } catch (e) {
      print(e.toString());
    }
  }
}
