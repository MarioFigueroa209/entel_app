import 'package:entel_app/src/reserva_salas/reserva_salas1_page.dart';
import 'package:flutter/material.dart';

import '../widgets/boton_menu.dart';

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("RESERVA/CONSULTA SALAS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotonMenu(
              title: 'RESERVAR CITA',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReservaSalas1()));
              },
              icon: Icons.person_add,
            ),
            const SizedBox(
              height: 20,
            ),
            BotonMenu(
              title: 'CONSULTA RESERVA',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Funcionalidad de consulta proximamente"),
                  backgroundColor: Colors.lightBlue,
                ));
              },
              icon: Icons.list,
            ),
          ],
        ),
      ),
    );
  }
}
