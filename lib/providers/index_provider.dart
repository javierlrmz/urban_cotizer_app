import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {

  PageController pageController = PageController();
  
  int _currentIndex = 0;

  int get currentIndex {
    return _currentIndex;
  }

  set currentIndex(int i){
    _currentIndex = i;
    notifyListeners();
  }

}