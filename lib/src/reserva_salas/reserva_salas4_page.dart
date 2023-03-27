import 'package:entel_app/src/menu_app.dart';
import 'package:entel_app/src/reserva_salas/reserva_salas1_page.dart';
import 'package:flutter/material.dart';

class ReservaSalas4 extends StatefulWidget {
  const ReservaSalas4({super.key});

  @override
  State<ReservaSalas4> createState() => _ReservaSalas4State();
}

class _ReservaSalas4State extends State<ReservaSalas4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Felicidades!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            const Text("Su reserva se ha generado",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18)),
            const SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              minWidth: double.infinity,
              height: 50.0,
              color: const Color.fromRGBO(255, 127, 17, 1),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MenuApp()));
              },
              child: const Text(
                "Ir al inicio",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
