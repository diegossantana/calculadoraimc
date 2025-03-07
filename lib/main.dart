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
            Container(
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
                    '24.22',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.greenAccent.shade700,
                    ),
                  ),
                  Text(
                    'Peso Normal',
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
                onPressed: () {},
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      18,
                    ), // Borda arredondada
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
