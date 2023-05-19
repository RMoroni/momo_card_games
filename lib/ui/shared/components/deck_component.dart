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
  // bool isMoving = false;
  List<CardEntity> cards = [];

  @override
  void initState() {
    cards = widget.cards;
    cards.last.visible = true;
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
          decoration: BoxDecoration(border: Border.all()),
          child: Stack(
            children: [
              ...(cards).map((card) => CardComponent(card: card)),
              // if (isMoving) EmptyCard(),
            ],
          ),
        );
      },
      // onMove: (data) {
      //   setState(() {
      //     isMoving = true;
      //   });
      // },
      onAccept: (data) {
        if (data is CardEntity) {
          setState(() {
            cards.add(data);
          });
        }
      },
      onLeave: (data) {
        setState(() {
          cards.remove(data);
        });
      },
    );
  }
}
