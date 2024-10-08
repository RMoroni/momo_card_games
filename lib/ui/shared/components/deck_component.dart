import 'package:flutter/material.dart';
import 'package:momo_card_games/ui/shared/components/card_component.dart';

import '../../../domain/entities/card.dart';

class DeckComponent extends StatefulWidget {
  final List<CardEntity> cards;
  final bool onTopDeck;

  const DeckComponent({
    super.key,
    required this.cards,
    this.onTopDeck = false,
  });

  @override
  State<StatefulWidget> createState() => _DeckComponentState();
}

class _DeckComponentState extends State<DeckComponent> {
  // bool isMoving = false;
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

  bool willAcceptCard(CardEntity card) {
    if (cards.isEmpty) {
      return widget.onTopDeck ? card.cardValue == 1 : true;
    } else if (card.cardValue - cards.last.cardValue == 1) {
      return widget.onTopDeck ? (card.cardType == cards.last.cardType) : false;
    } else if (card.cardValue - cards.last.cardValue == -1) {
      return widget.onTopDeck ? false : (card.cardType != cards.last.cardType);
    } else {
      return false;
    }
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
      onWillAcceptWithDetails: (draggableData) {
        if (draggableData.data is CardEntity) {
          return willAcceptCard(draggableData.data as CardEntity);
        }
        return false;
      },
      onAcceptWithDetails: (draggableData) {
        setState(() {
          cards.add(draggableData.data as CardEntity);
        });
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
