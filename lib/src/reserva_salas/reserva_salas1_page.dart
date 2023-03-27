import 'package:entel_app/src/reserva_salas/reserva_salas2_page.dart';
import 'package:flutter/material.dart';

import '../../models/reserva_salas/vw_get_all_edificios.dart';
import '../../models/reserva_salas/vw_get_salas_by_edificio.dart';
import '../../services/reserva_salas/reserva_salas_service.dart';

class ReservaSalas1 extends StatefulWidget {
  const ReservaSalas1({super.key});

  @override
  State<ReservaSalas1> createState() => _ReservaSalas1State();
}

class _ReservaSalas1State extends State<ReservaSalas1> {
  final _formKey = GlobalKey<FormState>();

  String valueEdificioDropdown = 'Seleccione el Edificio';

  String valueSalaDropdown = 'Seleccione la Sala';

  late int idEdificio;

  late int idSala;

  late String getNombreEdificio;

  List<VwGetAllEdificios> vwGetAllEdificios = <VwGetAllEdificios>[];

  List<VwGetSalasByEdificio> vwGetSalasByEdificio = <VwGetSalasByEdificio>[];

  getEdificios() async {
    ReservaSalasService reservaSalasService = ReservaSalasService();

    vwGetAllEdificios = await reservaSalasService.getAllEdificios();
    setState(() {
      vwGetAllEdificios;
    });

    print(vwGetAllEdificios.length);
  }

  getSalasByEdificios(int idEdificios) async {
    ReservaSalasService reservaSalasService = ReservaSalasService();

    vwGetSalasByEdificio =
        await reservaSalasService.getSalasByEdificio(idEdificio);
    setState(() {
      vwGetSalasByEdificio;
    });
  }

  List<DropdownMenuItem<String>> getEdificiosLista(
      List<VwGetAllEdificios> edificios) {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (var element in edificios) {
      var newDropDown = DropdownMenuItem(
        value: element.idEdifcio.toString(),
        child: Text(
          element.nombreEdificio.toString(),
        ),
      );
      dropDownItems.add(newDropDown);
    }

    return dropDownItems;
  }

  List<DropdownMenuItem<String>> getSalasByEdificio(
      List<VwGetSalasByEdificio> edificios) {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (var element in edificios) {
      var newDropDown = DropdownMenuItem(
        value: element.idSala.toString(),
        child: Text(
          element.nombreSala.toString(),
        ),
      );
      dropDownItems.add(newDropDown);
    }
    return dropDownItems;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEdificios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reserva de Salas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Edificio',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 85, 1),
                    fontSize: 20.0,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
                items: getEdificiosLista(vwGetAllEdificios),
                onChanged: (value) => {
                  setState(() async {
                    valueEdificioDropdown = value as String;
                    idEdificio = int.parse(value.toString());
                    await getSalasByEdificios(idEdificio);
                  }),
                  getNombreEdificio = vwGetAllEdificios[0].nombreEdificio!,
                },
                validator: (value) {
                  if (value != valueEdificioDropdown) {
                    return 'Por favor, elige el edificio';
                  }
                  return null;
                },
                hint: Text(valueEdificioDropdown),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Sala',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 85, 1),
                    fontSize: 20.0,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
                items: getSalasByEdificio(vwGetSalasByEdificio),
                onChanged: (value) => {
                  setState(() {
                    valueSalaDropdown = value as String;
                  }),
                  idSala = int.parse(value.toString()),
                  print(idSala)
                },
                validator: (value) {
                  if (value != valueSalaDropdown) {
                    return 'Por favor, elige la sala';
                  }
                  return null;
                },
                hint: Text(valueSalaDropdown),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minWidth: double.infinity,
                height: 50.0,
                color: const Color.fromRGBO(255, 127, 17, 1),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservaSalas2(
                                  idSala: idSala,
                                  edificio: getNombreEdificio,
                                )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Por favor seleccionar Edificio y Sala"),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                child: const Text(
                  "Consultar disponibilidad",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
