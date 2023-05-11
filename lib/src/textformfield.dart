import 'package:flutter/cupertino.dart' hide CupertinoTextFormFieldRow;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'textformfield_cupertino.dart';

import 'builder.dart';

class PlatformTextFormField extends StatelessWidget {
  const PlatformTextFormField({
    super.key,
    this.label,
    this.suffix,
    this.prefix,
    this.minLines,
    this.placeholder,
    this.maxLines = 1,
    this.backgroundColor,
    this.controller,
    this.focusNode,
    this.inputFormatters,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;

  final Widget? suffix;
  final Widget? prefix;
  final Widget? label;

  final Color? backgroundColor;

  final int? minLines;
  final int? maxLines;
  final String? placeholder;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      iOSBuilder: (context) {
        return CupertinoListSection(
          backgroundColor: Colors.transparent,
          topMargin: 0.0,
          header: label,
          children: [
            CupertinoTextFormFieldRow(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: backgroundColor ?? Colors.transparent,
              ),
              suffix: suffix != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: suffix!)
                  : null,
              prefix: prefix != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: prefix!)
                  : null,
              padding:
                  const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 20.0),
              placeholder: placeholder,
              focusNode: focusNode,
              controller: controller,
              inputFormatters: inputFormatters,
              maxLines: maxLines,
              minLines: minLines,
            ),
          ],
        );
      },
      builder: (context, platform) {
        return ListTile(
          title: TextFormField(
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: backgroundColor != null,
              fillColor: backgroundColor,
              hintText: placeholder,
              suffix: suffix,
              prefix: prefix,
              label: label,
            ),
          ),
        );
      },
    );
  }
}
