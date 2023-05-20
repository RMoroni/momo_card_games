import 'package:momo_card_games/ui/ui.dart';

class Routes {
  static const home = '/home';
  static const klondike = '/klondike';

  static final routes = {
    Routes.home: (_) => HomeScreen(),
    Routes.klondike: (_) => KlondikeScreen(),
  };
}