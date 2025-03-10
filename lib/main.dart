// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:calculadoraimc/minha_calculadora_de_imc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MinhaCalculadoraDeImc(),
    );
  }
}
