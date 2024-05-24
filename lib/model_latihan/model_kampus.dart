// To parse this JSON data, do
//
//     final modelKampus = modelKampusFromJson(jsonString);

import 'dart:convert';

ModelKampus modelKampusFromJson(String str) => ModelKampus.fromJson(json.decode(str));

String modelKampusToJson(ModelKampus data) => json.encode(data.toJson());

class ModelKampus {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelKampus({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelKampus.fromJson(Map<String, dynamic> json) => ModelKampus(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String nama;
  String lokasi;
  String gambar;
  String lat;
  String long;
  String profile;

  Datum({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.gambar,
    required this.lat,
    required this.long,
    required this.profile,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["nama"],
    lokasi: json["Lokasi"],
    gambar: json["Gambar"],
    lat: json["Lat"],
    long: json["long"],
    profile: json["profile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "Lokasi": lokasi,
    "Gambar": gambar,
    "Lat": lat,
    "long": long,
    "profile": profile,
  };
}
