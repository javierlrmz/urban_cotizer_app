import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {

  String _title = '';

  PageController pageController = PageController();
  
  int _currentIndex = 0;
  
  String get title {
    // notifyListeners();
    return _title;
  }

  int get currentIndex {
    
    return _currentIndex;
  }

  set currentIndex(int i){
    _currentIndex = i;
    switch (_currentIndex){

      case 0:
        _title = 'Tablero';
        // notifyListeners();
        break;

      case 1:
        _title = 'Cotizaciones';
        // notifyListeners();

        break;
      
      case 2:
        _title = 'Clientes';
        // notifyListeners();

        break;

      case 3:
        _title = 'Ateciones';
        // notifyListeners();

        break;
    
      case 4:
        _title = 'Productos';
        // notifyListeners();

        break;
  }
    notifyListeners();
  }

}