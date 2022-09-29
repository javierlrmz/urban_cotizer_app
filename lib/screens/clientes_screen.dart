import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/providers/providers.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../theme/decorations.dart';


class ClientesScreen extends StatelessWidget {
  const ClientesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  


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
            const CustomFilter(),

            const SizedBox(width: 5),

            // BOTÓN AÑADIR / NUEVO
            CustomButton( Icons.add, 35, 42, Colors.green, onPressed: () => Navigator.pushNamed(context, 'newCLiente') ),
            ],
          ),
          
          const SizedBox(height: 10),

          // LISTADO
          const Expanded(
            child: CustomListBuilder(),
          )
        ],
        
      ),
    );
  }
}

class CustomListBuilder extends StatelessWidget {

  const CustomListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    
    final personaProvider = Provider.of<PersonaProvider>(context);

    final List listPersonas = personaProvider.personas;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: personaProvider.personas.length,
        itemBuilder: (context, int index ) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [Decorations.buildShadow(const Offset(-1, 2))]
          ),
          child: Center(
            child: CustomListTile(listPersonas: listPersonas[index]),
          ),
        )
      );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.listPersonas,
  }) : super(key: key);

  final Persona listPersonas;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
    title: Text(listPersonas.nombre),
    subtitle: Text.rich(
      TextSpan( // default text style
        children: [
          const WidgetSpan(child: Icon(Icons.business_sharp, size: 12), alignment: PlaceholderAlignment.top),
          const WidgetSpan(child: SizedBox(width: 2,)),
          TextSpan(
            text: '${listPersonas.calle} #${listPersonas.calleNumero}, ${listPersonas.colonia}, ${listPersonas.ciudad}, C.P. ${listPersonas.codigoPostal}.'),
          const WidgetSpan(child: SizedBox(width: 3,)),
          
          const WidgetSpan(child: Icon(Icons.call, size: 12), alignment: PlaceholderAlignment.top),
          const WidgetSpan(child: SizedBox(width: 3,)),
          TextSpan(text: listPersonas.telefono, ),
          const WidgetSpan(child: SizedBox(width: 4,)),

            ],
          ),
        ),
    trailing: const TrailingButtons(),
    onTap: () => FutureBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        return const Text('TTTTTT');
        } 
      ),
    );
  }
}






class TrailingButtons extends StatelessWidget {
  const TrailingButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
        
          Expanded(
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.add,
                color: Colors.green,
                size: 28,
                ),
              onPressed: (){},
              ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.edit,
                color: Colors.black54,
                size: 25,
                ),
              onPressed: (){},
              ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 25,
                ),
              onPressed: (){},
              ),
          ),
          
        ],
      ),
    );
  }
}
