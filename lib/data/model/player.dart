import 'dart:ffi';

class Player {
  final Long id;
  final String name;
  final int number;

  Player(this.id, this.name, this.number);

  String getName() {
    return name;
  }
}