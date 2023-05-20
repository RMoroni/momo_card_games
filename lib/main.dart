import 'package:flutter/material.dart';
import 'package:momo_card_games/app/app.dart';
import 'package:momo_card_games/ui/ui.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momo Klondike',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeScreen(),
      routes: Routes.routes,
    );
  }
}
