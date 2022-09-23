import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRouter {

  static final Map<String, Widget Function(BuildContext)> routes = {
        'home'         : (_) => HomeScreen(),
        'cotizaciones' : (_) => const CotizacionesScreen(),
        'clientes'     : (_) => const ClientesScreen(),
        'productos'    : (_) => const ProductosScreen(),
      };

}