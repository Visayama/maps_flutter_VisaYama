// To parse this JSON data, do
//
//     final modelProvinsi = modelProvinsiFromJson(jsonString);

import 'dart:convert';

ModelProvinsi modelProvinsiFromJson(String str) => ModelProvinsi.fromJson(json.decode(str));

String modelProvinsiToJson(ModelProvinsi data) => json.encode(data.toJson());

class ModelProvinsi {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelProvinsi({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelProvinsi.fromJson(Map<String, dynamic> json) => ModelProvinsi(
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
  String idProvinsi;
  String namaProvinsi;

  Datum({
    required this.idProvinsi,
    required this.namaProvinsi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idProvinsi: json["id_provinsi"],
    namaProvinsi: json["nama_provinsi"],
  );

  Map<String, dynamic> toJson() => {
    "id_provinsi": idProvinsi,
    "nama_provinsi": namaProvinsi,
  };
}
