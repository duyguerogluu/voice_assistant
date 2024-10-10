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
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant/mycolor.dart';
import 'package:voice_assistant/openai_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  final flutterTts = FlutterTts();
  String? generatedContent;
  String? generatedImageUrl;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initSpeechToText();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  Future<void> onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            final speech = await openAIService.isArtPromptAPI(lastWords);
            if (speech.contains('http')) {
              generatedImageUrl = speech;
              generatedContent = null;
            }
            await systemSpeak(speech);
            await stopListening();
          } else {
            initSpeechToText();
          }
        },
        backgroundColor: MyColor.firstSuggestionBoxColor,
        child: const Icon(Icons.mic),
      ),
      appBar: AppBar(
        title: const Text('Voice Assistant'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            const Column(
              children: [
                FeatureBox(
                  color: MyColor.firstSuggestionBoxColor,
                  headerText: 'ChatGPT',
                  description:
                      'A smarter way too stay organized and informed with ChatGPT',
                ),
                FeatureBox(
                  color: MyColor.secondSuggestionBoxColor,
                  headerText: 'Dall-E',
                  description:
                      'Get inspired and stay creative with your personal assistant powered by Dall-E',
                ),
                FeatureBox(
                  color: MyColor.thirdSuggestionBoxColor,
                  headerText: 'Smart Voice Assistant',
                  description:
                      'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String description;
  const FeatureBox({
    super.key,
    required this.color,
    required this.headerText,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0).copyWith(
          left: 15,
        ),
        child: Column(
          children: [
            Text(
              headerText,
              style: const TextStyle(
                fontFamily: 'Cera Pro',
                color: MyColor.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Cera Pro',
                  color: MyColor.blackColor,
                ),
              ),
            ),
          ],
        ),
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
