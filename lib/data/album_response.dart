import 'dart:convert';

List<AlbumResponse> albumResponseFromJson(String str) => List<AlbumResponse>.from(json.decode(str).map((x) => AlbumResponse.fromJson(x)));

String albumResponseToJson(List<AlbumResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumResponse {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumResponse({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory AlbumResponse.fromJson(Map<String, dynamic> json) => AlbumResponse(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}

/*
class AlbumResponse {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumResponse(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  AlbumResponse.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}*/
