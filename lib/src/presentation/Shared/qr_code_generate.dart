import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImageGenerator extends StatelessWidget {
  final EdgeInsets? margin;

  const QRImageGenerator(this.qrcode, {super.key, this.margin});

  final String qrcode;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 100),
      elevation: 3,
      color: Colors.white,
      child: QrImageView(
        data: qrcode,
        version: QrVersions.min,
      ),
    );
  }
}
