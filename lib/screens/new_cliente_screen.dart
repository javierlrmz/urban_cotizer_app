
import 'package:flutter/material.dart';

import '../theme/decorations.dart';

class NewClienteScreen extends StatelessWidget {
   
  const NewClienteScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Agregar nuevo cliente'),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children:[
                
                const SizedBox(height: 5,),
                
                Center(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      // labelText: 'Tipo',
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                      ),
                    borderRadius: BorderRadius.circular(10),
                    value: 'Persona',
                    items: const [
                      DropdownMenuItem(value: "Persona", child: Text("Persona")),
                      DropdownMenuItem(value: "Empresa", child: Text("Empresa")),
                      ],
                    onChanged: (value ){}),
                ),

                const CustomField(labelText: 'Nombre',),
                const CustomField(labelText: 'Telefono',),
                const CustomField(labelText: 'Calle',),
                const CustomField(labelText: 'Numero Exterior',),
                const CustomField(labelText: 'Numero interior',),
                const CustomField(labelText: 'Código Postal',),
                
                
              ],
            ),
          ),
        ),
      )
    );
  }

}

 class CustomField extends StatelessWidget {

    final String? hintText;

    final String labelText;

  const CustomField({super.key, this.hintText, required this.labelText});
    
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [Decorations.buildShadow(const Offset(-1, 2))]
          ),
          child: TextFormField(
            decoration: InputDecoration(
            labelText: labelText,         
            hintText: hintText,
            fillColor: Colors.white,
            isDense: true,
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            focusedBorder: outlineBorder(),
            border: outlineBorder()
              )
            ),
        ),
      );
    }

      OutlineInputBorder outlineBorder() {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
      );
    }
  }