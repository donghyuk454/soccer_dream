import 'package:dream/data/model/player.dart';

class User {
  final String name;
  final List<Player> players;

  User(this.name, this.players);

  String getName() {
    return name;
  }

  List<Player> getPlayers() {
    return players;
  }
}