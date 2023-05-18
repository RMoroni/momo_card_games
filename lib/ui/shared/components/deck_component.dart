import 'package:flutter/material.dart';
import 'package:momo_card_games/ui/shared/components/card_component.dart';

import '../../../domain/entities/card.dart';

class DeckComponent extends StatefulWidget {
  final int limit;
  final List<CardEntity> cards;

  const DeckComponent({super.key, required this.limit, required this.cards});

  @override
  State<StatefulWidget> createState() => _DeckComponentState();
}

class _DeckComponentState extends State<DeckComponent> {
  List<CardEntity> cards = [];

  @override
  void initState() {
    cards = widget.cards;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Stack(
          children: [
            ...(cards).map((e) => CardComponent(card: e)),
          ],
        );
      },
      onAccept: (data) {
        if (data is CardEntity) {
          setState(() {
            cards.add(data);
          });
        }
      },
      onLeave: (data) {
        setState(() {
          cards.removeLast();
        });
      },
    );
  }
}
