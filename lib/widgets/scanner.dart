import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<String> scanBarcodeNormal(BuildContext context) async {
  String barcodeScanRes;

  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#5D87FF', 'Отмена', true, ScanMode.QR);
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }

  return barcodeScanRes;
}
