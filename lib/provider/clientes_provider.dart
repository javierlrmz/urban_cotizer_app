import 'package:flutter/material.dart';

class ClientesProvider extends ChangeNotifier {

  final clientes = List<String>.generate(100, (i) => 'Item $i');
}