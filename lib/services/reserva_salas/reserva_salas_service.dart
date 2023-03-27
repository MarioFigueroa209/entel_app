import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/reserva_salas/sp_create_reserva_salas.dart';
import '../../models/reserva_salas/vw_get_all_edificios.dart';
import '../../models/reserva_salas/vw_get_salas_by_edificio.dart';
import '../api_service.dart';

class ReservaSalasService {
  List<VwGetAllEdificios> parseAllEdificios(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<VwGetAllEdificios>((json) => VwGetAllEdificios.fromJson(json))
        .toList();
  }

  Future<List<VwGetAllEdificios>> getAllEdificios() async {
    var res = await http
        .get((urlGetAllEdficios), headers: {"Accept": "application/json"});

    if (res.statusCode == 200) {
      return parseAllEdificios(res.body);
    } else {
      throw Exception('No se pudo obtener las ordenes');
    }
  }

  List<VwGetSalasByEdificio> parserSalasByEdificio(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<VwGetSalasByEdificio>(
            (json) => VwGetSalasByEdificio.fromJson(json))
        .toList();
  }

  Future<List<VwGetSalasByEdificio>> getSalasByEdificio(int idEdificio) async {
    final response = await http
        .get(Uri.parse(urlGetSalasByIdEdificio + idEdificio.toString()));
    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      return parserSalasByEdificio(response.body);
    } else {
      //Si esta respuesta no fue OK, lanza un error.
      throw Exception('No se pudo obtener el registro');
    }
  }

  Future<VwGetSalasByEdificio> getSalaById(int idSala) async {
    var url = Uri.parse(urlGetSalasById + idSala.toString());

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return VwGetSalasByEdificio.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fallo al cargar');
    }
  }

  Future<SpCreateReservaSalas> createReservaSalas(
      SpCreateReservaSalas value) async {
    Map data = value.toJson();

    final http.Response response = await http.post(
      urlCreateReservaSalas,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return SpCreateReservaSalas.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post data');
    }
  }
}
