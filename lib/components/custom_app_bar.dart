
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/providers/index_provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override // TOMA LA MEDIDA AUTOMATICA
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    final indexProvider = Provider.of<IndexProvider>(context);
    
    return AppBar(
      title: Text(indexProvider.title)
    );
  }
}