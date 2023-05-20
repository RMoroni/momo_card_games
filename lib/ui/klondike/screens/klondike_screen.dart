import 'package:flutter/material.dart';

import '../../../domain/entities/card.dart';
import '../../ui.dart';

class KlondikeScreen extends StatefulWidget {
  const KlondikeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _KlondikeScreenState();

}
class _KlondikeScreenState extends State<KlondikeScreen> {
  int countFinishedDecks = 0;
  final deck = CardExtension.createDeck();

  void finishCallback() {
    setState(() {
      countFinishedDecks++;
    });
    if (countFinishedDecks == 7) {
      print('parabens');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('klondike'),
      ),
      body: Row(
        children: [
          DeckComponent(limit: 5, cards: deck.sublist(0,5)),
          const SizedBox(width: 10),
          DeckComponent(limit: 5, cards: deck.sublist(6,10)),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
}