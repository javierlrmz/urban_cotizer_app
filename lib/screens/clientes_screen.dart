import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/provider/clientes_provider.dart';

import '../components/components.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
  final clientesProvider = Provider.of<ClientesProvider>(context);

  final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          const SizedBox(height: 20),
      
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              SizedBox(
                width: size.width*0.7,
                child: const CustomSearch(),
            ),
      
            const SizedBox(width: 10),
      
            CustomAddButton(),
            ],
          ),
          
          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: clientesProvider.clientes.length,
                itemBuilder: (context, int index ) => ListTile(
                title: Text(clientesProvider.clientes[index]),
                subtitle: Text('subtitle'),
                trailing: Text('asdasd'),
                )
              ),
          )
        ],
        
      ),
    );
  }
}
