import 'package:flutter/material.dart';

import '../theme/decorations.dart';

class ProductosScreen extends StatelessWidget {
   
  const ProductosScreen({Key? key}) : super(key: key);
  

  final tab = const TabBar(tabs: <Tab>[
      
    Tab(child: Text('Productos')),
    Tab(child: Text('Servicios')),
    Tab(child: Text('Paquetes')),

    ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
        preferredSize: tab.preferredSize,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [Decorations.buildShadow(const Offset(0, 3))],
            color: Colors.black
          ),
          child: tab,
        )
      
        )
      ),
    );
  }
}
