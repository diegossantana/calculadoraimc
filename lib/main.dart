// ignore_for_file: sized_box_for_whitespace

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

class MinhaCalculadoraDeImc extends StatefulWidget {
  const MinhaCalculadoraDeImc({super.key});

  @override
  State<MinhaCalculadoraDeImc> createState() => _MinhaCalculadoraDeImcState();
}

class _MinhaCalculadoraDeImcState extends State<MinhaCalculadoraDeImc> {
  TextEditingController pesoController = TextEditingController(text: '');
  TextEditingController alturaController = TextEditingController(text: '');

  double imc = -1;
  String classificacao = '';
  Color corResultado = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Calculador IMC'),
        leading: Icon(Icons.calculate_rounded),
        backgroundColor: Colors.blueGrey.shade600,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imc == -1
                ? Text(
                  'Calcule seu IMC \n Insira seu peso e sua altura nos campos abaixo.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                )
                : Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(
                      width: 6,
                      color: Colors.greenAccent.shade700,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        imc.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 42,
                          color: Colors.greenAccent.shade700,
                        ),
                      ),
                      Text(
                        classificacao = getClassificacaoIMC(imc),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.greenAccent.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Seu peso', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 8),
                    Container(
                      width: 75,
                      child: TextField(
                        controller: pesoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixText: 'kg',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 22),
                Column(
                  children: [
                    Text('Sua altura', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 8),
                    Container(
                      width: 75,
                      child: TextField(
                        controller: alturaController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixText: 'm',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  double peso = double.parse(pesoController.text);
                  double altura = double.parse(alturaController.text);
                  setState(() {
                    imc = peso / (altura * altura);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      18,
                    ), // Borda arredondada
                  ),
                ),
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getClassificacaoIMC(double imc) {
    if (imc <= 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc <= 24.9) {
      return 'Peso normal';
    } else if (imc >= 25.0 && imc <= 29.9) {
      return 'Sobrepeso';
    } else if (imc >= 30.0 && imc <= 34.9) {
      return 'Obesidade Grau I';
    } else if (imc >= 35.0 && imc <= 39.9) {
      return 'Obesidade Grau II';
    } else if (imc >= 40.0) {
      return 'Obesidade Grau III';
    }

    return 'IMC inválido: $imc';
  }
}
