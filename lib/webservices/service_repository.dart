import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carsome/base/base_repository.dart';
import 'package:flutter_carsome/data/album_response.dart';

import 'api_methods.dart';

class ServiceRepository extends BaseRepository {
  //api: call get Redeemed voucher List
  Future<List<AlbumResponse>> getAlbumList({@required String path}) async {
    final response = await networkProvider.callWebService(
        method: ApiMethod.GET, path: path, headers: buildHeader());
    return albumResponseFromJson(response);
  }
}
