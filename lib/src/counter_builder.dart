import 'dart:async';

import 'package:flutter/widgets.dart';

class CounterBuilder extends StatefulWidget {
  const CounterBuilder({
    super.key,
    this.child,
    required this.builder,
    this.reverse = false,
    this.timeout = const Duration(seconds: 30),
    this.duration = const Duration(seconds: 1),
  });

  final Widget? child;
  final ValueWidgetBuilder<Duration> builder;

  final bool reverse;
  final Duration timeout;
  final Duration duration;

  @override
  State<CounterBuilder> createState() => _CounterBuilderState();
}

class _CounterBuilderState extends State<CounterBuilder> {
  late Duration _timeout;
  Timer? _timer;

  void _restartTimer() {
    if (widget.reverse) {
      _createReverseTimer();
    } else {
      _createTimer();
    }
  }

  void _createTimer() {
    _timer?.cancel();
    _timeout = Duration.zero;
    _timer = Timer.periodic(widget.duration, (timer) {
      if (_timeout >= widget.timeout) {
        timer.cancel();
      } else {
        setState(() {
          _timeout += widget.duration;
        });
      }
    });
  }

  void _createReverseTimer() {
    _timer?.cancel();
    _timeout = widget.timeout;
    _timer = Timer.periodic(widget.duration, (timer) {
      if (_timeout <= Duration.zero) {
        timer.cancel();
      } else {
        setState(() {
          _timeout -= widget.duration;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _restartTimer();
  }

  @override
  void didUpdateWidget(covariant CounterBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration ||
        oldWidget.timeout != widget.timeout) {
      _restartTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _timeout, widget.child);
  }
}
