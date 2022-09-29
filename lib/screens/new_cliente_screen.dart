

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/providers/form_state_provider.dart';

import '../components/custom_components.dart';
import '../theme/decorations.dart';

class NewClienteScreen extends StatelessWidget {
   
  const NewClienteScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final formStateProvider = Provider.of<FormStateProvider>(context);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Agregar nuevo cliente'),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: size.width * 0.9,
              child: Form(
                key: formStateProvider.formkey,
                child: Column(
                  
                  children:[

                    const SizedBox(height: 10),
                    
                    // TIPO -- CODIGO POSTAL
                    Row(
                      children: const [
                        
                        Expanded(child: DropMenuTipo()),

                        SizedBox(width: 15,),

                        Expanded(child: CustomField(
                          labelText: 'Código Postal', 
                          formatter: r'^-?[0-9]+$',
                          inputType: TextInputType.number,
                          maxLength: 7,
                          )),
                    
                      ],
                    ),
                    
                    // NOMBRE
                    const CustomField(labelText: 'Nombre', formatter: r'^[a-zA-Z ]+$', maxLength: 17, inputType: TextInputType.name,),

                     // CALLE 
                    const CustomField(labelText: 'Calle', formatter:  r'^[a-zA-Z ]+$', maxLength: 20,),
                    
                    // NUMERO INTERIOR --- EXTERIOR
                    Row(
                      children: const[
                            
                        Expanded(child: CustomField(labelText: 'Numero exterior', formatter: r'^-?[0-9]+$', maxLength: 7, inputType: TextInputType.number,)),
                        SizedBox(width: 15,),
                        Expanded(child: CustomField(labelText: 'Numero interior', formatter: r'^-?[0-9]+$', maxLength: 7, inputType: TextInputType.number,)), 
                            
                    
                      ],
                    ),

                    const SizedBox(height: 10),

                    CustomContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (value){},
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET
                           ),
                          ),
                      ),
                    ),

                    

                    const SizedBox(height: 30,),
                    
                    // BOTÓN DE GUARDAR
                    SaveButton(onPressed: () => print('HOLAAA ${formStateProvider.formkey} ${formStateProvider.isValidForm()}'),)

                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

}


class SaveButton extends StatelessWidget {
  
  final Function() onPressed;

  const SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50)
      ),
      onPressed: onPressed, 
      child: const Text('Guardar'));
  }
}

class DropMenuTipo extends StatelessWidget {
  const DropMenuTipo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [Decorations.buildShadow(const Offset(-1, 2))]
      ),
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(10),
        items: const [
            DropdownMenuItem(value: 'Persona', child: Text('Persona')),
            DropdownMenuItem(value: 'Empresa', child: Text('Empresa')),
          ],
        onChanged: (value) {  },
        decoration: InputDecoration(
          
          labelText: 'Tipo',         
          // hintText: 'hintText',
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          focusedBorder: outlineBorder10(),
          border: outlineBorder10()
          ),
        
        ),
    );
  }
}

 class CustomField extends StatelessWidget {

    final String? hintText;

    final String labelText;

    final String formatter;

    final TextInputType? inputType;

    final int maxLength;

    const CustomField({super.key, this.hintText, required this.labelText, required this.formatter, this.inputType, required this.maxLength});
    
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
            keyboardType: inputType,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(formatter)),
              LengthLimitingTextInputFormatter(maxLength)
            ],
            decoration: InputDecoration(
            labelText: labelText,         
            hintText: hintText,
            fillColor: Colors.white,
            isDense: true,
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            focusedBorder: outlineBorder10(),
            border: outlineBorder10()
              )
            ),
        ),
      );
    }

      
  }
  