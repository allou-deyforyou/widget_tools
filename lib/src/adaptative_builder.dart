import 'package:flutter/widgets.dart';

typedef ValueChangedWidgetBuilder<T> = Widget Function(
    BuildContext context, T value);

enum BoxType {
  small,
  large,
  medium,
}

class AdaptativeBuilder extends StatelessWidget {
  const AdaptativeBuilder({
    super.key,
    required this.builder,
    this.largeBuilder,
    this.mediumBuilder,
    this.smallBuilder,
  });

  final ValueChangedWidgetBuilder<BoxType> builder;

  final WidgetBuilder? mediumBuilder;
  final WidgetBuilder? smallBuilder;
  final WidgetBuilder? largeBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width <= 640) {
          return smallBuilder?.call(context) ?? builder(context, BoxType.small);
        } else if (width >= 1008) {
          return largeBuilder?.call(context) ?? builder(context, BoxType.large);
        }
        return mediumBuilder?.call(context) ?? builder(context, BoxType.medium);
      },
    );
  }
}
