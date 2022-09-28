// To parse this JSON data, do
//
//     final persona = personaFromMap(jsonString);

import 'dart:convert';

class Persona {
    Persona({
        this.id,
        required this.nombre,
        required this.telefono,
        required this.calle,
        required this.calleNumero,
        required this.numeroInterior,
        required this.codigoPostal,
        required this.colonia,
        required this.ciudad,
        required this.estado,
        required this.pais,
    });

    String? id;
    String nombre;
    String telefono;
    String calle;
    String calleNumero;
    String numeroInterior;
    String codigoPostal;
    String colonia;
    String ciudad;
    String estado;
    String pais;

    factory Persona.fromJson(String str) => Persona.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Persona.fromMap(Map<String, dynamic> json) => Persona(
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        calle: json["calle"],
        calleNumero: json["calleNumero"],
        numeroInterior: json["numeroInterior"],
        codigoPostal: json["codigoPostal"],
        colonia: json["colonia"],
        ciudad: json["ciudad"],
        estado: json["estado"],
        pais: json["pais"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "telefono": telefono,
        "calle": calle,
        "calleNumero": calleNumero,
        "numeroInterior": numeroInterior,
        "codigoPostal": codigoPostal,
        "colonia": colonia,
        "ciudad": ciudad,
        "estado": estado,
        "pais": pais,
    };
}
