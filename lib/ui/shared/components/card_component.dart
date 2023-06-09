import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.card, required this.callback});

  final CardEntity card;
  final void Function(CardEntity) callback;

  @override
  Widget build(BuildContext context) {
    if (card.visible) {
      return Draggable(
        data: card,
        feedback: CardStyle(
          card: card,
          isDragging: true,
        ),
        // childWhenDragging: const EmptyCard(),
        child: CardStyle(
          card: card,
          isDragging: false,
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => callback(card),
        child: const EmptyCard(),
      );
    }
  }
}

class CardStyle extends StatelessWidget {
  static const height = 200.0;
  static const width = 150.0;

  final CardEntity card;
  final bool isDragging;

  const CardStyle({
    super.key,
    required this.card,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: isDragging ? Colors.purple : Colors.lightBlue,
      child: Center(
        child: Text(
          '${card.cardKey} - ${card.cardType.name}',
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CardStyle.height,
      width: CardStyle.width,
      color: Colors.grey,
    );
  }
}
