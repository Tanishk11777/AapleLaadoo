import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{
  int count = 0;
  int get counter => count;

  double total = 0.0 ;
  double get totalPrice => total;

  void _setPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    prefs.setInt('cart_item', count);
    prefs.setDouble('total_price', total);
    notifyListeners();
  }
  void _getPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    count = prefs.getInt('cart_item') ?? 0;
    total = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }
  void addTotalPrice (double productPrice){
    total = total +productPrice ;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice (double productPrice){
    total = total - productPrice ;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice (){
    _getPrefItems();
    return  total ;
  }


  void addCounter (){
    count++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter (){
    count--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter (){
    _getPrefItems();
    return count;
  }
}