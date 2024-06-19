import 'package:flutter/material.dart';
import 'package:pratice_language_app/models/product_model.dart';
import 'package:provider/provider.dart';

class CardProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQty(int index) => _cart[index].quantity++;
  decrementQty(int index) => _cart[index].quantity--;
  totalprice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  static CardProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CardProvider>(context, listen: listen);
  }
}
