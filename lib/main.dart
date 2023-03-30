import 'package:flutter/material.dart';
import 'package:world_clock/choose_location.dart';
import 'package:world_clock/home.dart';
import 'package:world_clock/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Clock',
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}



