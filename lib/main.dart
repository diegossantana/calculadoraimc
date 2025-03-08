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
  TextEditingController? pesoController;
  TextEditingController? alturaController;

  double? imc;
  String? classificacao;
  Color? corResultado;

  @override
  void initState() {
    pesoController = TextEditingController(text: '');
    alturaController = TextEditingController(text: '');
    imc = -1;
    classificacao = '';
    corResultado = Colors.white;
    super.initState();
  }

  @override
  void dispose() {
    pesoController!.dispose();
    alturaController!.dispose();
    super.dispose();
  }

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
                    border: Border.all(width: 6, color: corResultado!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        imc!.toStringAsFixed(2),
                        style: TextStyle(fontSize: 42, color: corResultado),
                      ),
                      Text(
                        classificacao!,
                        style: TextStyle(fontSize: 20, color: corResultado),
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
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      try {
                        double peso = double.parse(pesoController!.text);
                        double altura = double.parse(alturaController!.text);
                        setState(() {
                          imc = peso / (altura * altura);
                          classificacao = getClassificacaoIMC(imc!);
                          corResultado = getCorIMC(imc!);
                        });
                      } on Exception {
                        resetFields();
                      }
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
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: resetFields,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          18,
                        ), // Borda arredondada
                      ),
                    ),
                    child: Icon(
                      Icons.restart_alt_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
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

  Color getCorIMC(double imc) {
    if (imc <= 18.5) {
      return Colors.blue;
    } else if (imc >= 18.5 && imc <= 24.9) {
      return Colors.greenAccent.shade700;
    } else if (imc >= 25.0 && imc <= 29.9) {
      return Color(0xFFF4BE8E);
    } else if (imc >= 30.0 && imc <= 34.9) {
      return Color(0xFFEE9809);
    } else if (imc >= 35.0 && imc <= 39.9) {
      return Color(0xFFE44F38);
    } else if (imc >= 40.0) {
      return Colors.red;
    }

    return Colors.lightBlueAccent;
  }

  void resetFields() {
    setState(() {
      pesoController = TextEditingController(text: '');
      alturaController = TextEditingController(text: '');
      imc = -1;
      classificacao = '';
      corResultado = Colors.black;
    });
  }
}
