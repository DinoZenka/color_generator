// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(colorLocalDataSource)
final colorLocalDataSourceProvider = ColorLocalDataSourceProvider._();

final class ColorLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ColorLocalDataSource,
          ColorLocalDataSource,
          ColorLocalDataSource
        >
    with $Provider<ColorLocalDataSource> {
  ColorLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ColorLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ColorLocalDataSource create(Ref ref) {
    return colorLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorLocalDataSource>(value),
    );
  }
}

String _$colorLocalDataSourceHash() =>
    r'e31e73196790993ec86777932a7672a2f9ee3871';

@ProviderFor(randomNumber)
final randomNumberProvider = RandomNumberProvider._();

final class RandomNumberProvider
    extends $FunctionalProvider<RandomNumber, RandomNumber, RandomNumber>
    with $Provider<RandomNumber> {
  RandomNumberProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomNumberProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomNumberHash();

  @$internal
  @override
  $ProviderElement<RandomNumber> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RandomNumber create(Ref ref) {
    return randomNumber(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RandomNumber value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RandomNumber>(value),
    );
  }
}

String _$randomNumberHash() => r'f04140d6228a32588951abf737a3ee57fe721f0d';

@ProviderFor(colorRepository)
final colorRepositoryProvider = ColorRepositoryProvider._();

final class ColorRepositoryProvider
    extends
        $FunctionalProvider<ColorRepository, ColorRepository, ColorRepository>
    with $Provider<ColorRepository> {
  ColorRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorRepositoryHash();

  @$internal
  @override
  $ProviderElement<ColorRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ColorRepository create(Ref ref) {
    return colorRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorRepository>(value),
    );
  }
}

String _$colorRepositoryHash() => r'83d787fa56a6cd2e814a85b4f623e5b5c38f8646';
