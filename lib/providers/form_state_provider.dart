import 'package:flutter/material.dart';

class FormStateProvider extends ChangeNotifier {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  isValidForm(){
    return formkey.currentState?.validate() ?? false;
  }

}