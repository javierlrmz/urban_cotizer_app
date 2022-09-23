import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_cotizer_app/provider/clientes_provider.dart';
import 'package:urban_cotizer_app/providers/providers.dart';
import 'package:urban_cotizer_app/router/app_router.dart';
import 'package:urban_cotizer_app/screens/home_screen.dart';

void main() {
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => IndexProvider()),
        ChangeNotifierProvider( create: (_) => ClientesProvider()),
      ],
      child: const MyApp()
      )
    );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      
      home: HomeScreen(),
      
      // Referencia al router que contiene toda la clase
      routes: AppRouter.routes,
    );
  }
}