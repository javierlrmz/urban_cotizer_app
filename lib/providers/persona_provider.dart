
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/models.dart';

class PersonaProvider extends ChangeNotifier {
  
  final resp = ' {"12312" : { "nombre": "Pedro Pérez", "telefono": "3321558360", "calle": "Av. Acueducto", "calleNumero": "6050", "numeroInterior": "15", "codigoPostal": "44160", "colonia": "Lomas del Bosque", "ciudad": "Zapopan", "estado": "Jalisco", "pais": "México"}}';

  List<Persona> personas = [];

  bool isLoading = false;

  PersonaProvider(){
    loadProducts().then((value) => notifyListeners());
  }

  Future<List<Persona>>loadProducts() async {
    
    isLoading = true;
    notifyListeners();

    final Map<String, dynamic> personasMap = await jsonDecode(resp);

    personasMap.forEach((key, value) {
      // print('');
      final tempPersona = Persona.fromMap(value);
      tempPersona.id = key;
      // print(key);
      personas.add(tempPersona);
      });

    isLoading = false;
    notifyListeners();  
    return personas;
    }    
} 