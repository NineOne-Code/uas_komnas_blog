import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:uas_komnas_blog/ui/main/main.dart';

class PDFScreen extends StatelessWidget {
  final String asset;
  PDFScreen({Key? key, required this.asset}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: Column(
        children: [
          Header(
            scafoldkey: _scaffoldKey,
            isAppbar: true,
          ),
          Expanded(
            child: SfPdfViewer.asset(
              asset,
              initialZoomLevel: 2,
            ),
          ),
        ],
      ),
    );
  }
}
