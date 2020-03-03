import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carsome/util/app_messages.dart';
import 'package:http/http.dart' as http;
import 'api_methods.dart';

class NetworkProvider {
  NetworkProvider._internal();

  static final NetworkProvider _singleInstance = NetworkProvider._internal();

  factory NetworkProvider() => _singleInstance;

  ///base

  ///log
  final String _tagRequest = '====== Request =====>';
  final String _tagResponse = '====== Response =====>';

  Future callWebService(
      {@required String path,
      Map headers,
      Encoding encoding,
      @required ApiMethod method,
      Map<String, dynamic> body}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      AppMessage.toast('No Network Connection!');
      return null;
    }
    var responseData;
    debugPrint(' $_tagRequest  $method   $path');
    debugPrint(' $jsonEncode($body)');
    switch (method) {
      case ApiMethod.GET:
        {
          responseData = await http.get(path, headers: {
            "Content-Type": "application/json",
          });
        }
        break;

      case ApiMethod.POST:
        {
          responseData = await http.post(path,
              headers: {
                "Content-Type": "application/json",
              },
              body: json.encode(body));
        }
        break;
      case ApiMethod.PUT:
        // TODO: Handle this case if needed.
        break;

      case ApiMethod.DELETE:
        // TODO: Handle this case if needed.
        break;
    }

    debugPrint(
        '$_tagResponse ${responseData.statusCode} - $path \n ${responseData.body}');
    if (responseData.statusCode == 200) {
      return (responseData.body);
    } else {
      AppMessage.toast('${responseData.statusCode} - ${responseData.message}');
    }
  }
}
