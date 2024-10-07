import 'package:flutter/material.dart';
import 'package:voice_assistant/colors.dart';
import 'package:voice_assistant/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voice Assistant',
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Mycolor.whiteColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Mycolor.whiteColor,
          )),
      home: const HomePage(),
    );
  }
}
