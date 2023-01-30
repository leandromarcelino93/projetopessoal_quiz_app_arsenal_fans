import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:projetopessoal_quiz_app_arsenal_fans/quiz_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Perguntas',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const QuizAppSplashScreen(),
    );
  }
}

class QuizAppSplashScreen extends StatelessWidget {

  const QuizAppSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/images/escudo_arsenal.jpg',
                  fit: BoxFit.cover,),
              ),
              const Text('Quiz App Arsenal fans',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.red,
      nextScreen: const QuizApp(),
      splashIconSize: 300,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}