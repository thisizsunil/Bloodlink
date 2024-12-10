// ignore_for_file: file_names

import 'package:flutter/material.dart';

class KeyboardUtil{
  // context will gwt from when class is called 
  static void hidekeyboard(BuildContext context ){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if(!currentFocus.hasPrimaryFocus){
      currentFocus.unfocus();
    }
  }
}