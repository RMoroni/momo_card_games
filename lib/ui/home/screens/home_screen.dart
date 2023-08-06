import 'package:flutter/material.dart';

import '../../../app/injectable/injectable.dart';
import '../../../app/navigation/navigator.dart';
import '../../../app/navigation/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final navigator = injectable.get<NavigatorInterface>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Klondike'),
          Center(
            child: ElevatedButton(
              onPressed: () {
                navigator.pushNamed(
                  context: context,
                  route: Routes.klondike,
                );
              },
              child: const Text('Jogar'),
            ),
          ),
        ],
      ),
    );
  }

}