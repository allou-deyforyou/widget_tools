import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef PlatformWidgetBuilder = Widget Function(
    BuildContext context, TargetPlatform platform);

class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder({
    Key? key,
    required this.builder,
    this.androidBuilder,
    this.fuchsiaBuilder,
    this.iOSBuilder,
    this.linuxBuilder,
    this.macOSBuilder,
    this.windowsBuilder,
    this.webBuilder,
  }) : super(key: key);

  final PlatformWidgetBuilder builder;

  final WidgetBuilder? iOSBuilder;
  final WidgetBuilder? androidBuilder;
  final WidgetBuilder? macOSBuilder;
  final WidgetBuilder? windowsBuilder;
  final WidgetBuilder? linuxBuilder;
  final WidgetBuilder? fuchsiaBuilder;
  final PlatformWidgetBuilder? webBuilder;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return webBuilder?.call(context, defaultTargetPlatform) ??
          builder(context, defaultTargetPlatform);
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder?.call(context) ??
            builder(context, defaultTargetPlatform);
      case TargetPlatform.iOS:
        return iOSBuilder?.call(context) ??
            builder(context, defaultTargetPlatform);
      case TargetPlatform.macOS:
        return macOSBuilder?.call(context) ??
            builder(context, defaultTargetPlatform);
      case TargetPlatform.windows:
        return windowsBuilder?.call(context) ??
            builder(context, defaultTargetPlatform);
      case TargetPlatform.linux:
        return linuxBuilder?.call(context) ??
            builder(context, defaultTargetPlatform);
      case TargetPlatform.fuchsia:
        return fuchsiaBuilder?.call(context) ??
            builder(context, defaultTargetPlatform);
    }
  }
}
