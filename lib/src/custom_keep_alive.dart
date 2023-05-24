import 'package:flutter/widgets.dart';

class CustomKeepAlive extends StatefulWidget {
  const CustomKeepAlive({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CustomKeepAlive> createState() => _CustomKeepAliveState();
}

class _CustomKeepAliveState extends State<CustomKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
