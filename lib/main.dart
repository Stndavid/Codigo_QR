import 'package:codigoqr/qr_barras_code.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lector QR/Código de barras')),
      body: Center(
        child: ElevatedButton(
          child: Text('Escanear código'),
          onPressed: () async {
            final scanResult = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QRScannerPage()),
            );
            if (scanResult != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Resultado: $scanResult')),
              );
            }
          },
        ),
      ),
    );
  }
}
