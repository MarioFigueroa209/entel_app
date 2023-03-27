import 'package:entel_app/src/reserva_salas/reserva_salas4_page.dart';
import 'package:flutter/material.dart';

import '../../models/reserva_salas/sp_create_reserva_salas.dart';
import '../../services/reserva_salas/reserva_salas_service.dart';
import '../../widgets/constants.dart';

class ReservaSalas3 extends StatefulWidget {
  ReservaSalas3(
      {super.key,
      required this.idSala,
      required this.fechaReserva,
      required this.horaInicioReserva,
      required this.sala,
      required this.capacidad,
      required this.multimedia,
      required this.edificio});
  final int idSala;
  final String edificio;
  final String sala;
  final String multimedia;
  final int capacidad;
  final DateTime fechaReserva;
  final String horaInicioReserva;

  @override
  State<ReservaSalas3> createState() => _ReservaSalas3State();
}

class _ReservaSalas3State extends State<ReservaSalas3> {
  final salaController = TextEditingController();

  final TextEditingController edificioController = TextEditingController();

  final horaReservaController = TextEditingController();

  final capacidadController = TextEditingController();

  final multimediaController = TextEditingController();

  changeData() {
    edificioController.text = widget.edificio;
    salaController.text = widget.sala;
    horaReservaController.text = widget.horaInicioReserva;
    capacidadController.text = widget.capacidad.toString();
    multimediaController.text = widget.multimedia;
  }

  crearReservaSala() {
    ReservaSalasService reservaSalasService = ReservaSalasService();
    reservaSalasService.createReservaSalas(SpCreateReservaSalas(
        idSala: widget.idSala,
        fechaReserva: widget.fechaReserva,
        horaInicioReserva: widget.horaInicioReserva,
        horaFinReserva: null));
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReservaSalas4()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("VERIFICAR RESERVA"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              //color: kColorAzul,
              child: const Center(
                child: Text("ESTA SEGURO QUE DESEA RESERVAR ESTA SALA ?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              //shadowColor: Colors.grey,
              elevation: 10,
              borderOnForeground: true,
              //margin: const EdgeInsets.all(10),

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //Caja de  texto Chassis
                    TextFormField(
                      decoration: InputDecoration(
                          /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ), */
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: kColorAzul,
                          ),
                          labelText: 'Sala',
                          labelStyle: TextStyle(
                            color: kColorAzul,
                            fontSize: 20.0,
                          ),
                          hintText: 'Ingrese el numero de chasis'),
                      controller: salaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, datos del vehiculo';
                        }
                        return null;
                      },
                      enabled: false,
                    ),

                    //Caja de texto Marca
                    TextFormField(
                      decoration: InputDecoration(
                          /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ), */
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.branding_watermark,
                            color: kColorAzul,
                          ),
                          labelText: 'Edificio',
                          labelStyle: TextStyle(
                            color: kColorAzul,
                            fontSize: 20.0,
                          ),
                          hintText: 'Ingrese la marca'),
                      controller: edificioController,
                      enabled: false,
                    ),

                    //Caja de texto Bill of Lading
                    TextFormField(
                      decoration: InputDecoration(
                          /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ), */
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.wysiwyg,
                            color: kColorAzul,
                          ),
                          labelText: 'Hora Reserva',
                          labelStyle: TextStyle(
                            color: kColorAzul,
                            fontSize: 20.0,
                          ),
                          hintText: 'Ingrese Bill of Lading'),
                      controller: horaReservaController,
                      enabled: false,
                    ),

                    //Caja de texto de Nave de Embarque
                    TextFormField(
                      decoration: InputDecoration(
                          /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ), */
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.directions_boat,
                            color: kColorAzul,
                          ),
                          labelText: 'Capacidad:',
                          labelStyle: TextStyle(
                            color: kColorAzul,
                            fontSize: 20.0,
                          ),
                          hintText: 'Ingrese mave de embarque'),
                      controller: capacidadController,
                      enabled: false,
                    ),

                    //Caja de texto de Puerto Destino
                    TextFormField(
                      decoration: InputDecoration(
                          /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ), */
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.houseboat,
                            color: kColorAzul,
                          ),
                          labelText: 'Multimedia',
                          labelStyle: TextStyle(
                            color: kColorAzul,
                            fontSize: 20.0,
                          ),
                          hintText: 'Ingrese multimedia'),
                      controller: multimediaController,
                      enabled: false,
                    ),
                  ],
                ),
              ),
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
                crearReservaSala();
              },
              child: const Text(
                "CONFIRMAR",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
