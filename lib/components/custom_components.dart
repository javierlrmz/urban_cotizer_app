
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/providers/providers.dart';

import '../theme/theme.dart';

//* THIS FILE CONTAINS:
//* --- CustomBottomBar   #1
//* --- CustomButton      #2
//* --- CustomFilter      #3
//* --- CustomSearch      #4

//* ========= #1 ==========

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

      onTap: ( value){
        // print(value);
        indexProvider.currentIndex = value;
        onTap(value);
      },

    );
  }
}

//* ========= #2 ==========

class CustomButton extends StatelessWidget {
  
  final double widtheight;

  final IconData icon;
  final double iconSize;

  final Color color;

  final Function() onPressed;

  const CustomButton( this.icon, this.iconSize, this.widtheight, this.color, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [Decorations.buildShadow(const Offset(-1, 2))]
          ),
          child: SizedBox(width: widtheight, height: widtheight),
          ),

        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(icon, size: iconSize, color: color,),
          onPressed: onPressed

        )
      ],
    );
  }
}

//* ========= #3 ==========

class CustomFilter extends StatelessWidget {
  const CustomFilter({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [Decorations.buildShadow( const Offset(-1, 2))],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: DropdownButton(
          style: const TextStyle(fontSize: 12, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          value: 'Más recientes',
          // TODO: estado del filtro y filtros
          underline: Container(color: Colors.white,),
          items: const [
            DropdownMenuItem(value: "Más recientes", child: Text("Más recientes")),
            DropdownMenuItem(value: "Jalisco", child: Text("Jalisco")),
            DropdownMenuItem(value: "Antiguedad", child: Text("Antiguedad")),
            DropdownMenuItem(value: "England", child: Text("England")),
            ],
          onChanged: (value ){}),
      ),
    );
  }
}

//* ========= #4 ==========

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.customShadow(const Offset(-2, 3)),
      child: TextField(
        // TODO Llenar onpressed de custombutton
        decoration: InputDecoration(
          suffixIcon: CustomButton(Icons.search, 25, 40, Colors.black54, onPressed: (){}),
          hintText: 'Buscar',
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          focusedBorder: buildInputRounded100(),
          border: buildInputRounded100()
          )
        ),
    );
  }
}

//* ======== #5 ===========
class CustomContainer extends StatelessWidget {

  final Widget child;

  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [Decorations.buildShadow(Offset(-1, 2))],
      ),
      child: child,
    );
  }
}