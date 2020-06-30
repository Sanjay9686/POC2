import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CartCount with ChangeNotifier{

  int value=0;
  void cartIncrement(){
    value++;
   notifyListeners();
  }
  void reset(){
    value=0;
    notifyListeners();
  }


}