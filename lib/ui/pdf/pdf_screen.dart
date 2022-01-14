import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatelessWidget {
  final String asset;
  const PDFScreen({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfPdfViewer.asset(
          asset,
          initialZoomLevel: 2,
        ),
      ),
    );
  }
}
