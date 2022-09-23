
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/providers/providers.dart';

class CustomBottomBar extends StatelessWidget {

  final void Function(int index) onTap;

  const CustomBottomBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final indexProvider = Provider.of<IndexProvider>(context);

    return BottomNavigationBar(

      currentIndex: indexProvider.currentIndex,

      backgroundColor: Colors.black,
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.blue,
      items: const [
        
        BottomNavigationBarItem(
          icon: Icon(Icons.window),
          label: 'Inicio',
          ),

        BottomNavigationBarItem(
          icon: Icon(Icons.file_copy_sharp),
          label: 'Cotizaciones',
          ),

        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Clientes',
          ),

        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'Atenciones',
          ),

        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2),
          label: 'Productos',
          ),
      ],

      onTap: ( value ){
        // print(value);
        indexProvider.currentIndex = value;
        onTap(value);
      },

    );
  }
}
