import 'package:flutter_carsome/base/base_notifier.dart';
import 'package:flutter_carsome/data/album_response.dart';
import 'package:flutter_carsome/webservices/api_service_repository.dart';
import 'package:flutter_carsome/webservices/service_repository.dart';

class HomeNotifier extends BaseNotifier {
  bool _isPortrait = true;
  final _repository = ServiceRepository();
  List<AlbumResponse> _albumListPortrait;
  List<AlbumResponse> _albumListLandscape;
  int _gridSpanCount = 2;

  int get gridSpanCount => _gridSpanCount;

  set gridSpanCount(int value) {
    _gridSpanCount = value;
    notifyListeners();
  }

  HomeNotifier() {
    getAlbumList(isPortrait ? 1 : 2);
  }

  List<AlbumResponse> get albumListLandscape => _albumListLandscape;

  set albumListLandscape(List<AlbumResponse> value) {
    _albumListLandscape = value;
    notifyListeners();
  }

  List<AlbumResponse> get albumList => _albumListPortrait;

  set albumList(List<AlbumResponse> value) {
    _albumListPortrait = value;
    notifyListeners();
  }

  ///orientation checker
  bool get isPortrait => _isPortrait;

  set isPortrait(bool value) {
    _isPortrait = value;
    notifyListeners();
  }

  ///api call
  /*Future<List<AlbumResponse>>*/ getAlbumList(int queryParam) async {
    super.isLoading = true;
    List<AlbumResponse> _response = [];
    try {
      _response = await _repository.getAlbumList(
          path: BASE_URL + queryParam.toString());
      super.isLoading = false;
      queryParam == 1 ? updateList(_response) : updateLandscapeList(_response);
    } catch (e) {
      super.isLoading = false;
    }
   // return albumList;
  }

  void updateList(List<AlbumResponse> response) {
    albumList = [];
    this.albumList.addAll(response);
    getAlbumList(2);
  }

  void updateLandscapeList(List<AlbumResponse> response) {
    albumListLandscape = [];
    this.albumListLandscape.addAll(response);
  }
}
