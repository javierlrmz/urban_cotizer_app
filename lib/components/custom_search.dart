import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.customShadow(const Offset(-2, 3)),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          focusedBorder: buildInputDecoration(),
          border: buildInputDecoration()
          )
        ),
    );
  }

  

  OutlineInputBorder buildInputDecoration() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide.none
      );
  }
}