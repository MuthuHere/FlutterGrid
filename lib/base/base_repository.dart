import 'dart:io';

import 'package:flutter_carsome/webservices/api_services.dart';

class BaseRepository {
  final networkProvider = NetworkProvider();

  final headerContentType = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  Map<String, String> buildHeader() {
    Map<String, String> header = headerContentType;
    header.remove(HttpHeaders.authorizationHeader);
    return header;
  }
}
