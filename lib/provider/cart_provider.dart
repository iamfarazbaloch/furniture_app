import 'package:flutter/material.dart';
import '../model/furniture_item.dart';

class CartProvider with ChangeNotifier {
  final List<FurnitureItem> _items = [];

  List<FurnitureItem> get cartItems => _items;

  void addToCart(FurnitureItem item) {
    if (!_items.contains(item)) {
      _items.add(item);
      notifyListeners();
    }
  }

  void removeFromCart(FurnitureItem item) {
    _items.remove(item);
    notifyListeners();
  }

  bool isInCart(FurnitureItem item) {
    return _items.contains(item);
  }

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.price);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
