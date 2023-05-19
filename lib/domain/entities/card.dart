class CardEntity {
  final String cardKey;
  final CardType cardType;
  bool visible = false;

  int get cardValue => cardValuesMap[cardKey]!;

  CardEntity({required this.cardKey, required this.cardType});

  static const cardValuesMap = {
    'A': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'J': 11,
    'Q': 12,
    'K': 13,
  };
}

enum CardType {
  hearts,
  diamonds,
  clubs,
  spades,
}

extension CardExtension on CardEntity {
  static List<CardEntity> createDeck() {
    final List<CardEntity> deck = [];
    for (var key in CardEntity.cardValuesMap.keys) {
      for (var type in CardType.values) {
        deck.add(CardEntity(cardKey: key, cardType: type));
      }
    }
    return deck;
  }
}