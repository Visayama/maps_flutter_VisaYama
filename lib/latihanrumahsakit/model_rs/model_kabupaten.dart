// To parse this JSON data, do
//
//     final modelKabupaten = modelKabupatenFromJson(jsonString);

import 'dart:convert';

ModelKabupaten modelKabupatenFromJson(String str) => ModelKabupaten.fromJson(json.decode(str));

String modelKabupatenToJson(ModelKabupaten data) => json.encode(data.toJson());

class ModelKabupaten {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelKabupaten({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelKabupaten.fromJson(Map<String, dynamic> json) => ModelKabupaten(
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
  String idKabupaten;
  String idProvinsi;
  String namaKabupaten;

  Datum({
    required this.idKabupaten,
    required this.idProvinsi,
    required this.namaKabupaten,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idKabupaten: json["id_kabupaten"],
    idProvinsi: json["id_provinsi"],
    namaKabupaten: json["nama_kabupaten"],
  );

  Map<String, dynamic> toJson() => {
    "id_kabupaten": idKabupaten,
    "id_provinsi": idProvinsi,
    "nama_kabupaten": namaKabupaten,
  };
}
