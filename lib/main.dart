import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/services/services.dart';
import 'package:uas_komnas_blog/ui/main/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog UAS Komnas',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: GoogleFonts.ralewayTextTheme().copyWith(
          bodyText1: const TextStyle(color: kBodyTextColor),
          bodyText2: const TextStyle(color: kBodyTextColor),
          headline5: const TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: MainScreen(),
    );
  }
}
