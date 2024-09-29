import 'package:flutter/material.dart';
import 'package:momo_card_games/ui/shared/components/card_component.dart';

import '../../../domain/entities/card.dart';

class DrawerComponent extends StatefulWidget {
  final List<CardEntity> cards;

  const DrawerComponent({
    super.key,
    required this.cards,
  });

  @override
  State<StatefulWidget> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  List<CardEntity> cards = [];

  void visibleCallback(CardEntity card) { }

  void cancelCallback(CardEntity card) { }

  void onClick() {
    setState(() {
      cards.removeLast(); //TODO send last card to draw deck
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
    return GestureDetector(
      onTap: onClick,
      child: Container(
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
        )
    );
  }
}
