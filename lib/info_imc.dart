import 'package:flutter/material.dart';

class InfoImc extends StatelessWidget {
  const InfoImc({
    super.key,
    required this.corResultado,
    required this.imc,
    required this.classificacao,
  });

  final Color? corResultado;
  final double? imc;
  final String? classificacao;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
    );
  }
}
