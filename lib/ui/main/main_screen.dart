import 'package:flutter/material.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/ui/home/home.dart';
import 'package:uas_komnas_blog/ui/main/main.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(scafoldkey: _scaffoldKey),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              child: const SafeArea(
                child: HomeScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
