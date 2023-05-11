import 'package:flutter/cupertino.dart';

abstract class DefaultAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
