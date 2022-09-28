import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/clientes_provider.dart';

class CotizacionesScreen extends StatelessWidget {
   
  const CotizacionesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  
  final clientesService = Provider.of<ClientesProvider>(context);

  final size = MediaQuery.of(context).size;

    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          const SizedBox(height: 20),
          
          // BUSCADOR - FILTRO - BOTÓN
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            // BUSCADOR
            SizedBox( width: size.width*0.5, child: const CustomSearch()),

            const SizedBox(width: 5),
            
            // FILTRO

            const SizedBox(width: 5),

            // BOTÓN AÑADIR / NUEVO
            CustomButton( Icons.add, 35, 47, Colors.green, onPressed: (){} ),
            ],
          ),
          
          const SizedBox(height: 10),

          // LISTADO
          Expanded(
            child: Container(),
          )
        ],
        
      ),
    );
  }
}