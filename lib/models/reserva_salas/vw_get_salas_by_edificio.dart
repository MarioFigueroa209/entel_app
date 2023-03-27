// To parse this JSON data, do
//
//     final vwGetSalasByEdificio = vwGetSalasByEdificioFromJson(jsonString);

import 'dart:convert';

List<VwGetSalasByEdificio> vwGetSalasByEdificioFromJson(String str) =>
    List<VwGetSalasByEdificio>.from(
        json.decode(str).map((x) => VwGetSalasByEdificio.fromJson(x)));

String vwGetSalasByEdificioToJson(List<VwGetSalasByEdificio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VwGetSalasByEdificio {
  VwGetSalasByEdificio({
    this.idSala,
    this.idEdifcio,
    this.nombreSala,
    this.capacidad,
    this.multimedia,
  });

  int? idSala;
  int? idEdifcio;
  String? nombreSala;
  int? capacidad;
  String? multimedia;

  factory VwGetSalasByEdificio.fromJson(Map<String, dynamic> json) =>
      VwGetSalasByEdificio(
        idSala: json["idSala"],
        idEdifcio: json["idEdifcio"],
        nombreSala: json["nombreSala"],
        capacidad: json["capacidad"],
        multimedia: json["multimedia"],
      );

  Map<String, dynamic> toJson() => {
        "idSala": idSala,
        "idEdifcio": idEdifcio,
        "nombreSala": nombreSala,
        "capacidad": capacidad,
        "multimedia": multimedia,
      };
}
