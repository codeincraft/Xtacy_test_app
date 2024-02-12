import 'dart:async';
import 'dart:convert';
import 'package:estacy/services/user_services.dart';
import 'package:http/http.dart' as httpClient;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiProvider {
  static httpClient.Client? http = httpClient.Client();
  String? baseUrl = 'https://stagingapi.ecstasynigeria.com';

  ApiProvider() {
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.fadingFour;
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.dark;
  }

  Future<dynamic> get(String url) async {
    var token = await UserService().jwtOrEmpty;

    print('token: $token');
    print('$baseUrl' + '$url');
    var respJson;
    httpClient.Response resp;
    try {
      EasyLoading.show(status: 'Loading ...');
      resp = await http!.get(
        Uri.parse(baseUrl! + url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );
      EasyLoading.dismiss();
      if (resp != null) respJson = _resp(url, resp);
      return respJson;
    } catch (e) {
      // throw e;
      // throw 'Could not connect to the server';
    }
  }

  Future<dynamic> post(String url, Map body) async {
    var token = await UserService().jwtOrEmpty;
    // print("token: " + token);
     print('$baseUrl' + '$url');
     print(body);
    var respJson;
    var resp;
    try {
      String requestUrl = baseUrl! + url;
      print(requestUrl);

      EasyLoading.show(status: 'Loading ...');
      resp = await http!.post(
        Uri.parse(requestUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
        body: utf8.encode(
          json.encode(body),
        ),
      );
      EasyLoading.dismiss();
    } catch (e) {
      throw e;
      
      // throw ('Could not connect to the server ');
    }

    if (resp != null) respJson = _resp(url, resp);
    return respJson;
  }

  // Put/Edit
  Future<dynamic> put(String url, Map body) async {
    var token = await UserService().jwtOrEmpty;

    var respJson;
    var resp;
    try {
      String requestUrl = baseUrl! + url;
      print(requestUrl);
      EasyLoading.show(status: 'Loading ...');
      resp = await http!.put(
        Uri.parse(requestUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
        body: utf8.encode(
          json.encode(body),
        ),
      );
      EasyLoading.dismiss();
    } catch (e) {
      throw ('Could not connect to the server ');
    }

    if (resp != null) respJson = _resp(url, resp);
    return respJson;
  }

  // Delete
  Future<dynamic> delete(String url,) async {
    var token = await UserService().jwtOrEmpty;
    var respJson;
    var resp;
    try {
      String requestUrl = baseUrl! + url;
      print(requestUrl);
      print('ur token is:');
      print(token);
      EasyLoading.show(status: 'Loading ...');
      resp = await http!.delete(
        Uri.parse(requestUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
        // body: utf8.encode(
        //   // json.encode(body),
        // ),
      );
      EasyLoading.dismiss();
    } catch (e) {
      throw ('Could not connect to the server ');
    }
    if (resp != null) respJson = _resp(url, resp);
    return respJson;
  }

  dynamic _resp(String url, resp) {
    print(resp.body);
    int statusCode = resp.statusCode;
    print('status code: ');
    print(statusCode);
    if ([200, 201].contains(statusCode)) {
      print('Successful');
      // if (resp.body is Map) {
        print(resp.body);
      var respJson = json.decode(resp.body);
      return respJson;
      // }
  

      // return true;
    } else if (statusCode == 403) {
      print('403 ...');
      throw 'An error has occured, retry';
      // throw 'You are not authorized to access this endpoint';
    
    } else if (statusCode == 404) {
      print('404 ...');
      throw 'Not found';
    } else {
      print('======= Error Caught ===');
      var respJson = json.decode(resp.body.toString());
      throw (respJson);
    }
  }
}  