
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  final String title;

  const CustomAppBar( this.title, {super.key} );

  @override // TOMA LA MEDIDA AUTOMATICA
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title)
    );
  }
}