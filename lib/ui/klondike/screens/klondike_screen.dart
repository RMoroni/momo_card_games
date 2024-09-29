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

  @override
  void initState() {
    deck.shuffle();
    super.initState();
  }

  void finishCallback() {
    setState(() {
      countFinishedDecks++;
    });
    if (countFinishedDecks == 7) {
      print('parabens');
    }
  }

  List<Widget> bottomDeck() {
    List<Widget> widgets = [];
    int aux = 0;
    for (int i = 0; i < 7; i++) {
      aux += i + 1;
      widgets.addAll([
        DeckComponent(cards: deck.sublist(aux - 1 - i, aux)),
        const SizedBox(width: 10),
      ]);
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Klondike'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              children: [
                DrawerComponent(
                  cards: deck.sublist(28, 52),
                ),
                const SizedBox(width: 10),
                DrawDeckComponent(
                  cards: List<CardEntity>.empty(growable: true),
                ),
                const SizedBox(
                  width: CardStyle.width + 20,
                ),
                for (int i = 0; i < 4; i++) ...[
                  DeckComponent(
                    cards: List<CardEntity>.empty(growable: true),
                    onTopDeck: true,
                  ),
                  const SizedBox(width: 10),
                ]
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: bottomDeck(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
