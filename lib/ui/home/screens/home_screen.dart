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
      body: Column(children: [
        Text('data'),
        ElevatedButton(
          onPressed: () {
            navigator.pushNamed(
              context: context,
              route: Routes.klondike,
            );
          },
          child: Text('Jogar'),
        ),
      ],),
    );
  }

}