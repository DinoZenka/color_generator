// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ColorNotifier)
final colorProvider = ColorNotifierProvider._();

final class ColorNotifierProvider
    extends $AsyncNotifierProvider<ColorNotifier, List<ColorModel>> {
  ColorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorNotifierHash();

  @$internal
  @override
  ColorNotifier create() => ColorNotifier();
}

String _$colorNotifierHash() => r'509b1e11b36fc63c38c15e82b1ca5979628097a2';

abstract class _$ColorNotifier extends $AsyncNotifier<List<ColorModel>> {
  FutureOr<List<ColorModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ColorModel>>, List<ColorModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ColorModel>>, List<ColorModel>>,
              AsyncValue<List<ColorModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ActiveColor)
final activeColorProvider = ActiveColorProvider._();

final class ActiveColorProvider extends $NotifierProvider<ActiveColor, Color?> {
  ActiveColorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeColorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeColorHash();

  @$internal
  @override
  ActiveColor create() => ActiveColor();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Color? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Color?>(value),
    );
  }
}

String _$activeColorHash() => r'8640d0bb2876ae51ad1dc7bb7a92e95f1b7c9405';

abstract class _$ActiveColor extends $Notifier<Color?> {
  Color? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Color?, Color?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Color?, Color?>,
              Color?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(displayColor)
final displayColorProvider = DisplayColorProvider._();

final class DisplayColorProvider
    extends $FunctionalProvider<Color, Color, Color>
    with $Provider<Color> {
  DisplayColorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'displayColorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$displayColorHash();

  @$internal
  @override
  $ProviderElement<Color> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Color create(Ref ref) {
    return displayColor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Color value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Color>(value),
    );
  }
}

String _$displayColorHash() => r'c55d51d752665009ad2d31d4740a5bd857ed41a1';

@ProviderFor(recentColors)
final recentColorsProvider = RecentColorsProvider._();

final class RecentColorsProvider
    extends
        $FunctionalProvider<
          List<ColorModel>,
          List<ColorModel>,
          List<ColorModel>
        >
    with $Provider<List<ColorModel>> {
  RecentColorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentColorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentColorsHash();

  @$internal
  @override
  $ProviderElement<List<ColorModel>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<ColorModel> create(Ref ref) {
    return recentColors(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ColorModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ColorModel>>(value),
    );
  }
}

String _$recentColorsHash() => r'0abf75f5e4c09fb3bae60ce6a214a440d4f8c67b';

@ProviderFor(filteredColors)
final filteredColorsProvider = FilteredColorsFamily._();

final class FilteredColorsProvider
    extends
        $FunctionalProvider<
          List<ColorModel>,
          List<ColorModel>,
          List<ColorModel>
        >
    with $Provider<List<ColorModel>> {
  FilteredColorsProvider._({
    required FilteredColorsFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'filteredColorsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredColorsHash();

  @override
  String toString() {
    return r'filteredColorsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ColorModel>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<ColorModel> create(Ref ref) {
    final argument = this.argument as bool;
    return filteredColors(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ColorModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ColorModel>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredColorsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredColorsHash() => r'1b09952ec61e014e87b6181beaa09dff514227d6';

final class FilteredColorsFamily extends $Family
    with $FunctionalFamilyOverride<List<ColorModel>, bool> {
  FilteredColorsFamily._()
    : super(
        retry: null,
        name: r'filteredColorsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredColorsProvider call(bool isFavoritesOnly) =>
      FilteredColorsProvider._(argument: isFavoritesOnly, from: this);

  @override
  String toString() => r'filteredColorsProvider';
}
