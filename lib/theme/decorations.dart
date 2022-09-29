
import 'package:flutter/material.dart';

class Decorations {
  
 static BoxDecoration customShadow(Offset offset) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      boxShadow: [buildShadow(offset)],
    );
  }

  static BoxShadow buildShadow(Offset offset) {
    return BoxShadow(
          color: Colors.black12,
          blurRadius:2,
          spreadRadius: 0.01,
          offset: offset
        );
  }
}

 OutlineInputBorder buildInputRounded100() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide.none
      );
  }

OutlineInputBorder outlineBorder10() {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
      );
    }