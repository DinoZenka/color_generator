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

String _$colorNotifierHash() => r'60678dd49809b2ba259d0028ffd433b73733d309';

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
