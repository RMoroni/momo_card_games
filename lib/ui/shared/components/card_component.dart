import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.card});

  final CardEntity card;

  @override
  Widget build(BuildContext context) {
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
  const EmptyCard({super.key, required this.callback});

  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        height: CardStyle.height,
        width: CardStyle.width,
        color: Colors.grey,
      ),
    );
  }
}
