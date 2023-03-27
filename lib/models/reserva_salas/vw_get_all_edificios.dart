// To parse this JSON data, do
//
//     final vwGetAllEdificios = vwGetAllEdificiosFromJson(jsonString);

import 'dart:convert';

List<VwGetAllEdificios> vwGetAllEdificiosFromJson(String str) =>
    List<VwGetAllEdificios>.from(
        json.decode(str).map((x) => VwGetAllEdificios.fromJson(x)));

String vwGetAllEdificiosToJson(List<VwGetAllEdificios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VwGetAllEdificios {
  VwGetAllEdificios({
    this.idEdifcio,
    this.nombreEdificio,
    this.ubicacion,
  });

  int? idEdifcio;
  String? nombreEdificio;
  String? ubicacion;

  factory VwGetAllEdificios.fromJson(Map<String, dynamic> json) =>
      VwGetAllEdificios(
        idEdifcio: json["idEdifcio"],
        nombreEdificio: json["nombreEdificio"],
        ubicacion: json["ubicacion"],
      );

  Map<String, dynamic> toJson() => {
        "idEdifcio": idEdifcio,
        "nombreEdificio": nombreEdificio,
        "ubicacion": ubicacion,
      };
}
