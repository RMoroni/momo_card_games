import 'package:flutter/material.dart';
import 'package:momo_card_games/ui/shared/components/card_component.dart';

import '../../../domain/entities/card.dart';

class DrawDeckComponent extends StatefulWidget {
  final List<CardEntity> cards;

  const DrawDeckComponent({
    super.key,
    required this.cards,
  });

  @override
  State<StatefulWidget> createState() => _DrawDeckComponentState();
}

class _DrawDeckComponentState extends State<DrawDeckComponent> {
  List<CardEntity> cards = [];

  void visibleCallback(CardEntity card) {
    final index = cards.indexWhere((element) => element == card);
    if (index != -1) {
      setState(() {
        cards[index].visible = true;
      });
    }
  }

  void cancelCallback(CardEntity card) {
    setState(() {
      cards.add(card);
    });
  }

  @override
  void initState() {
    cards = widget.cards;
    if (cards.isNotEmpty) {
      cards.last.visible = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (
          BuildContext context,
          _,
          __,
          ) {
        return Container(
          height: CardStyle.height,
          width: CardStyle.width,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              ...(cards).map((card) => CardComponent(
                card: card,
                callback: visibleCallback,
                cancelCallback: cancelCallback,
              )),
            ],
          ),
        );
      },
      onWillAcceptWithDetails: (_) {
        return false;
      },
      onLeave: (data) {
        if (data is CardEntity) {
          setState(() {
            cards.remove(data);
          });
        }
      },
    );
  }
}
