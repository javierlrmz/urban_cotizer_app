import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/screens/screens.dart';

import '../components/components.dart';
import '../providers/index_provider.dart';

class HomeScreen extends StatelessWidget {
  
  HomeScreen({Key? key}) : super(key: key);
  
  final PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {

    final indexProvider = Provider.of<IndexProvider>(context);

    return Scaffold(
      
      // APPBAR WIDGET, RECIBE EL TITULO
      appBar: const CustomAppBar('Tablero'),

      // BOTTOM BAR WIDGET,
      bottomNavigationBar: CustomBottomBar( 
        onTap: (index) => pageController.jumpToPage(
          index,
          // duration: const Duration(milliseconds: 200),
          // curve: Curves.ease
          ),),
      
      // MOSTRAR PANTALLAS
      body: PageView(
        controller: pageController,
        children: const [
          TableroScreen(),
          CotizacionesScreen(),
          ClientesScreen(),
          AtencionesScreen(),
          ProductosScreen()
        ],
        onPageChanged: (value) {
          indexProvider.currentIndex = value;
          },
      )
    );
  }
}
