import 'package:color_randomizer/data/datasources/color_local_data_source.dart';
import 'package:color_randomizer/data/repositories/color_repository_impl.dart';
import 'package:color_randomizer/data/repositories/random_number_impl.dart';
import 'package:color_randomizer/domain/repositories/color_repository.dart';
import 'package:color_randomizer/domain/repositories/random_number.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
ColorLocalDataSource colorLocalDataSource(Ref ref) {
  return ColorLocalDataSourceImpl(SharedPreferencesAsync());
}

@Riverpod(keepAlive: true)
RandomNumber randomNumber(Ref ref) {
  return RandomNumberImpl();
}

@Riverpod(keepAlive: true)
ColorRepository colorRepository(Ref ref) {
  return ColorRepositoryImpl(
    ref.watch(randomNumberProvider),
    ref.watch(colorLocalDataSourceProvider),
  );
}
