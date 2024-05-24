// To parse this JSON data, do
//
//     final modelKamar = modelKamarFromJson(jsonString);

import 'dart:convert';

ModelKamar modelKamarFromJson(String str) => ModelKamar.fromJson(json.decode(str));

String modelKamarToJson(ModelKamar data) => json.encode(data.toJson());

class ModelKamar {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelKamar({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelKamar.fromJson(Map<String, dynamic> json) => ModelKamar(
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
  String idKamar;
  String idRs;
  String namaKamar;
  String kamarTer;
  String kamarKos;
  String jumlahAntrian;
  String lat;
  String loong;

  Datum({
    required this.idKamar,
    required this.idRs,
    required this.namaKamar,
    required this.kamarTer,
    required this.kamarKos,
    required this.jumlahAntrian,
    required this.lat,
    required this.loong,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idKamar: json["id_kamar"],
    idRs: json["id_rs"],
    namaKamar: json["nama_kamar"],
    kamarTer: json["kamar_ter"],
    kamarKos: json["kamar_kos"],
    jumlahAntrian: json["jumlah_antrian"],
    lat: json["lat"],
    loong: json["loong"],
  );

  Map<String, dynamic> toJson() => {
    "id_kamar": idKamar,
    "id_rs": idRs,
    "nama_kamar": namaKamar,
    "kamar_ter": kamarTer,
    "kamar_kos": kamarKos,
    "jumlah_antrian": jumlahAntrian,
    "lat": lat,
    "loong": loong,
  };
}
