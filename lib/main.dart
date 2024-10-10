/*
 *  This file is part of voice_assistant.
 *
 *  voice_assistant is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  voice_assistant is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with voice_assistant.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:voice_assistant/home_page.dart';
import 'package:voice_assistant/mycolor.dart';

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
          scaffoldBackgroundColor: MyColor.whiteColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: MyColor.whiteColor,
          )),
      home: const HomePage(),
    );
  }
}
