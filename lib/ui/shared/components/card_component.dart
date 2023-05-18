import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({super.key, required this.card});

  final CardEntity card;

  @override
  State<StatefulWidget> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: widget.card,
      feedback: CardStyle(
        card: widget.card,
        isDragging: true,
      ),
      // childWhenDragging: Text('Carta vazia'),
      child: CardStyle(
        card: widget.card,
        isDragging: false,
      ),
    );
  }
}

class CardStyle extends StatelessWidget {
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
      height: 200,
      width: 150,
      color: isDragging ? Colors.red : Colors.lightBlue,
      child: Text('${card.cardKey} - ${card.cardType.name}', style: const TextStyle(fontSize: 12)),
    );
  }
}
