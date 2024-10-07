import 'package:flutter/material.dart';
import 'package:voice_assistant/colors.dart';
import 'package:voice_assistant/mycolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Assistant'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: MyColor.assistantCircleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: 125,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/virtualAssistant.png',
                    ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
