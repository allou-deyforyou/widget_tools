import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'builder.dart';

class PlatformListTile extends StatelessWidget {
  const PlatformListTile({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.additionalInfo,
    this.notched = false,
    this.backgroundColor,
    this.padding,
    this.onTap,
  });

  final bool notched;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  final VoidCallback? onTap;

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? additionalInfo;

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      androidBuilder: (context) {
        return ListTile(
          title: title,
          leading: leading,
          trailing: trailing,
          subtitle: subtitle,
          contentPadding: padding,
          tileColor: backgroundColor,
          onTap: onTap,
        );
      },
      builder: (context, platform) {
        return CupertinoListSection(
          children: [
            Visibility(
              visible: notched,
              replacement: CupertinoListTile(
                title: title,
                leading: leading,
                trailing: trailing,
                subtitle: subtitle,
                additionalInfo: additionalInfo,
                backgroundColor: backgroundColor,
                padding: padding,
                onTap: onTap,
              ),
              child: CupertinoListTile.notched(
                title: title,
                leading: leading,
                trailing: trailing,
                subtitle: subtitle,
                additionalInfo: additionalInfo,
                backgroundColor: backgroundColor,
                padding: padding,
                onTap: onTap,
              ),
            ),
          ],
        );
      },
    );
  }
}
