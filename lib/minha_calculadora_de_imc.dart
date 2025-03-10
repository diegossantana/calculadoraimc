import 'package:calculadoraimc/alert_message.dart';
import 'package:calculadoraimc/info_imc.dart';
import 'package:flutter/material.dart';

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

  double? valorAltura = 1.70;
  double? valorPeso = 62;

  @override
  void initState() {
    pesoController = TextEditingController(text: valorPeso!.toStringAsFixed(2));
    alturaController = TextEditingController(
      text: valorAltura!.toStringAsFixed(2),
    );
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
        backgroundColor: Colors.blueAccent.shade100,
        toolbarHeight: 30,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imc == -1
                ? AlertMessage()
                : InfoImc(
                  corResultado: corResultado,
                  imc: imc,
                  classificacao: classificacao,
                ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: onPesoTextFieldSlider()),
                SizedBox(width: 22),
                Expanded(child: onAlturaTextFieldSlider()),
              ],
            ),
            SizedBox(height: 40),
            Container(
              width: 200,
              height: 60,
              child: Row(
                children: [
                  onBotaoCalcular(),
                  SizedBox(width: 5),
                  onBotaoResetar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton onBotaoResetar() {
    return ElevatedButton(
      onPressed: resetFields,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18), // Borda arredondada
        ),
      ),
      child: Icon(Icons.restart_alt_outlined, color: Colors.white, size: 24),
    );
  }

  ElevatedButton onBotaoCalcular() {
    return ElevatedButton(
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
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18), // Borda arredondada
        ),
      ),
      child: Text(
        'Calcular',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Column onAlturaTextFieldSlider() {
    return Column(
      children: [
        Text('Sua altura', style: TextStyle(fontSize: 20)),
        SizedBox(height: 8),
        Container(
          width: 85,
          child: TextField(
            enabled: false,
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
        SliderTheme(
          data: SliderThemeData(trackHeight: 3),
          child: Slider(
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueGrey.shade200,
            value: valorAltura!,
            onChanged: (altura) {
              setState(() {
                valorAltura = altura;
                alturaController!.text = altura.toStringAsFixed(2);
              });
            },
            min: 0.30,
            max: 3.00,
          ),
        ),
      ],
    );
  }

  Column onPesoTextFieldSlider() {
    return Column(
      children: [
        Text('Seu peso', style: TextStyle(fontSize: 20)),
        SizedBox(height: 8),
        Container(
          width: 95,
          child: TextField(
            enabled: false,
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
        SliderTheme(
          data: SliderThemeData(trackHeight: 3),
          child: Slider(
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueGrey.shade200,
            value: valorPeso!,
            onChanged: (peso) {
              setState(() {
                valorPeso = peso;
                pesoController!.text = valorPeso!.toStringAsFixed(2);
              });
            },
            min: 1,
            max: 250,
          ),
        ),
      ],
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
      valorAltura = 1.70;
      valorPeso = 62;
      pesoController = TextEditingController(
        text: valorPeso!.toStringAsFixed(2),
      );
      alturaController = TextEditingController(
        text: valorAltura!.toStringAsFixed(2),
      );
      imc = -1;
      classificacao = '';
      corResultado = Colors.black;
    });
  }
}
