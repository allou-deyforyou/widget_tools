import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'builder.dart';

class PlatformSearchTextField extends StatelessWidget {
  const PlatformSearchTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.placeholder,
    this.focusNode,
  });

  final String? placeholder;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      iOSBuilder: (context) {
        return CupertinoSearchTextField(
          placeholder: placeholder,
          controller: controller,
          onChanged: onChanged,
          focusNode: focusNode,
          onTap: onTap,
        );
      },
      builder: (context, platform) {
        return SearchBar(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          hintText: placeholder,
          onTap: onTap,
        );
      },
    );
  }
}
