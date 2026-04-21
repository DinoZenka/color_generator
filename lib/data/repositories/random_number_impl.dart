import 'dart:math';

import 'package:color_randomizer/domain/repositories/random_number.dart';

class RandomNumberImpl implements RandomNumber {
  final _random = Random();

  @override
  int getRandomInt(int max) => _random.nextInt(max);
}
