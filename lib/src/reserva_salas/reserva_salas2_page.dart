import 'package:entel_app/src/reserva_salas/reserva_salas3_page.dart';
import 'package:flutter/material.dart';

import '../../models/reserva_salas/vw_get_salas_by_edificio.dart';
import '../../services/reserva_salas/reserva_salas_service.dart';
import '../../widgets/constants.dart';

class ReservaSalas2 extends StatefulWidget {
  const ReservaSalas2(
      {super.key, required this.idSala, required this.edificio});
  final int idSala;
  final String edificio;

  @override
  State<ReservaSalas2> createState() => _ReservaSalas2State();
}

DateTime now = DateTime.now();
/* String fechaHoy = "${now.year}/${now.month}/${now.day}"; */
String month = now.month.toString().padLeft(2, '0');
String year = now.year.toString();

String fechaMnn = "$year-$month-${now.day + 1}";
String fechaPasMnn = "$year-$month-${now.day + 2}";

class _ReservaSalas2State extends State<ReservaSalas2> {
  final _formKey = GlobalKey<FormState>();

  ReservaSalasService reservaSalasService = ReservaSalasService();

  DateTime date = DateTime.now();

  VwGetSalasByEdificio vwGetSalasByEdificio = VwGetSalasByEdificio();

  getSalaById() async {
    vwGetSalasByEdificio = await reservaSalasService.getSalaById(widget.idSala);

    salaController.text = vwGetSalasByEdificio.nombreSala!;
    capacidadController.text = vwGetSalasByEdificio.capacidad.toString();
    multimediaController.text = vwGetSalasByEdificio.multimedia!;
  }

  final salaController = TextEditingController();

  final capacidadController = TextEditingController();

  final multimediaController = TextEditingController();

  String valueFechaDropdown = 'Seleccione la Fecha';

  String valueHoraDropdown = 'Seleccione la Hora';

  final fechaDisponible = [/* fechaHoy, */ fechaMnn, fechaPasMnn];

  final horaDisponibles = [
    "9:00AM - 10:00AM",
    "10:00AM - 11:00AM",
    "11:00AM - 12:00PM",
    "12:00PM - 1:00PM",
    "1:00PM - 2:00PM",
    "2:00PM - 3:00PM",
    "3:00PM - 4:00PM",
    "4:00PM - 5:00PM",
    "5:00PM - 6:00PM"
  ];

  createReservaSalon() {
    if (_formKey.currentState!.validate()) {
      final fechaparse = DateTime.parse(valueFechaDropdown);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReservaSalas3(
                    fechaReserva: fechaparse,
                    horaInicioReserva: valueHoraDropdown,
                    idSala: widget.idSala,
                    sala: salaController.text,
                    capacidad: int.parse(capacidadController.text),
                    edificio: widget.edificio,
                    multimedia: multimediaController.text,
                  )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Por favor seleccionar Fecha y Hora"),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSalaById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Disponiblidad"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: kColorAzul,
                    ),
                    labelText: 'Sala',
                    labelStyle: TextStyle(
                      color: kColorAzul,
                      fontSize: 20.0,
                    ),
                    hintText: ''),
                controller: salaController,
                enabled: false,
              ),
              const SizedBox(
                height: 20,
              ),
              //Caja de Texto donde se lee la Marca
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(
                      Icons.branding_watermark,
                      color: kColorAzul,
                    ),
                    labelText: 'Capacidad',
                    labelStyle: TextStyle(
                      color: kColorAzul,
                      fontSize: 20.0,
                    ),
                    hintText: ''),
                controller: capacidadController,
                enabled: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(
                      Icons.branding_watermark,
                      color: kColorAzul,
                    ),
                    labelText: 'Multimedia',
                    labelStyle: TextStyle(
                      color: kColorAzul,
                      fontSize: 20.0,
                    ),
                    hintText: ''),
                controller: multimediaController,
                enabled: false,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Fecha Disponibles',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 85, 1),
                    fontSize: 20.0,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
                items: fechaDisponible.map((String a) {
                  return DropdownMenuItem<String>(
                    value: a,
                    child: Center(child: Text(a, textAlign: TextAlign.left)),
                  );
                }).toList(),
                onChanged: (value) => {
                  setState(() {
                    valueFechaDropdown = value as String;
                  })
                },
                validator: (value) {
                  if (value != valueFechaDropdown) {
                    return 'Por favor, elige la Fecha';
                  }
                  return null;
                },
                hint: Text(valueFechaDropdown),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Horas Disponibles',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 85, 1),
                    fontSize: 20.0,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
                items: horaDisponibles.map((String a) {
                  return DropdownMenuItem<String>(
                    value: a,
                    child: Center(child: Text(a, textAlign: TextAlign.left)),
                  );
                }).toList(),
                onChanged: (value) => {
                  setState(() {
                    valueHoraDropdown = value as String;
                  })
                },
                validator: (value) {
                  if (value != valueHoraDropdown) {
                    return 'Por favor, elige la Hora';
                  }
                  return null;
                },
                hint: Text(valueHoraDropdown),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minWidth: double.infinity,
                height: 50.0,
                color: const Color.fromRGBO(255, 127, 17, 1),
                onPressed: () {
                  createReservaSalon();
                },
                child: const Text(
                  "Reversar",
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

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    setState(() => this.date = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
      );

  /*  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: date.hour, minute: date.minute)); */
}
