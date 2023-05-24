import 'package:flutter/cupertino.dart';

abstract class CustomAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
