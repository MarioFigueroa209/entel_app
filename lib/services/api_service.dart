String urlApiBase = "https://consumarportwebapi.azurewebsites.net/api/";

/* ----- Reserva Salas---- */
final urlGetAllEdficios =
    Uri.parse("${urlApiBase}EntelAppReservaConsulta/getAllEltEdificios");

String urlGetSalasByIdEdificio =
    "${urlApiBase}EntelAppReservaConsulta/getSalasByIdEdificio?idEdificio=";

String urlGetSalasById = "${urlApiBase}EntelAppReservaConsulta/getEtlSalaById/";

final urlCreateReservaSalas =
    Uri.parse("${urlApiBase}EntelAppReservaConsulta/CreateReservaSalas");
