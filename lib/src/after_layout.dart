import 'package:flutter/widgets.dart';

class AfterLayout extends StatefulWidget {
  const AfterLayout({
    super.key,
    required this.afterLayout,
    required this.child,
  });

  final void Function(BuildContext context) afterLayout;
  final Widget child;

  @override
  State<AfterLayout> createState() => _AfterLayoutState();
}

class _AfterLayoutState extends State<AfterLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.whenComplete(() {
      widget.afterLayout.call(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
