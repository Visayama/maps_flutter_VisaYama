// To parse this JSON data, do
//
//     final modelgambar = modelgambarFromJson(jsonString);

import 'dart:convert';

Modelgambar modelgambarFromJson(String str) => Modelgambar.fromJson(json.decode(str));

String modelgambarToJson(Modelgambar data) => json.encode(data.toJson());

class Modelgambar {
  bool isSuccess;
  String message;
  List<String> data;

  Modelgambar({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory Modelgambar.fromJson(Map<String, dynamic> json) => Modelgambar(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
