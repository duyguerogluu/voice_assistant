import 'package:flutter/material.dart';
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
          const Virtualicon(),
          const AskText(),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: const Text(
              'Here are a few features',
              style: TextStyle(
                fontFamily: 'Cera Pro',
                color: MyColor.mainFontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AskText extends StatelessWidget {
  const AskText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColor.borderColor,
        ),
        borderRadius: BorderRadius.circular(20).copyWith(
          topLeft: Radius.zero,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          'Hi, How can I help you?',
          style: TextStyle(
            color: MyColor.mainFontColor,
            fontFamily: 'Cera Pro',
          ),
        ),
      ),
    );
  }
}

class Virtualicon extends StatelessWidget {
  const Virtualicon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
