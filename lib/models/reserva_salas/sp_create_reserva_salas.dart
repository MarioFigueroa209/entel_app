// To parse this JSON data, do
//
//     final spCreateReservaSalas = spCreateReservaSalasFromJson(jsonString);

import 'dart:convert';

SpCreateReservaSalas spCreateReservaSalasFromJson(String str) =>
    SpCreateReservaSalas.fromJson(json.decode(str));

String spCreateReservaSalasToJson(SpCreateReservaSalas data) =>
    json.encode(data.toJson());

class SpCreateReservaSalas {
  SpCreateReservaSalas({
    this.idSala,
    this.fechaReserva,
    this.horaInicioReserva,
    this.horaFinReserva,
  });

  int? idSala;
  DateTime? fechaReserva;
  String? horaInicioReserva;
  String? horaFinReserva;

  factory SpCreateReservaSalas.fromJson(Map<String, dynamic> json) =>
      SpCreateReservaSalas(
        idSala: json["idSala"],
        fechaReserva: DateTime.parse(json["fechaReserva"]),
        horaInicioReserva: json["horaInicioReserva"],
        horaFinReserva: json["horaFinReserva"],
      );

  Map<String, dynamic> toJson() => {
        "idSala": idSala,
        "fechaReserva": fechaReserva!.toIso8601String(),
        "horaInicioReserva": horaInicioReserva,
        "horaFinReserva": horaFinReserva,
      };
}
