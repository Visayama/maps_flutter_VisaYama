// To parse this JSON data, do
//
//     final modelRumahSakit = modelRumahSakitFromJson(jsonString);

import 'dart:convert';

ModelRumahSakit modelRumahSakitFromJson(String str) => ModelRumahSakit.fromJson(json.decode(str));

String modelRumahSakitToJson(ModelRumahSakit data) => json.encode(data.toJson());

class ModelRumahSakit {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelRumahSakit({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelRumahSakit.fromJson(Map<String, dynamic> json) => ModelRumahSakit(
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
  String idRs;
  String idKabupaten;
  String namaRs;
  String deskripsi;
  String alamat;
  String telp;
  String jmlhAntrian;
  String kamarTersedia;
  String gambar;
  String lat;
  String longg;

  Datum({
    required this.idRs,
    required this.idKabupaten,
    required this.namaRs,
    required this.deskripsi,
    required this.alamat,
    required this.telp,
    required this.jmlhAntrian,
    required this.kamarTersedia,
    required this.gambar,
    required this.lat,
    required this.longg,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idRs: json["id_rs"],
    idKabupaten: json["id_kabupaten"],
    namaRs: json["nama_rs"],
    deskripsi: json["deskripsi"],
    alamat: json["alamat"],
    telp: json["telp"],
    jmlhAntrian: json["jmlh_antrian"],
    kamarTersedia: json["kamar_tersedia"],
    gambar: json["gambar"],
    lat: json["lat"],
    longg: json["longg"],
  );

  Map<String, dynamic> toJson() => {
    "id_rs": idRs,
    "id_kabupaten": idKabupaten,
    "nama_rs": namaRs,
    "deskripsi": deskripsi,
    "alamat": alamat,
    "telp": telp,
    "jmlh_antrian": jmlhAntrian,
    "kamar_tersedia": kamarTersedia,
    "gambar": gambar,
    "lat": lat,
    "longg": longg,
  };
}
