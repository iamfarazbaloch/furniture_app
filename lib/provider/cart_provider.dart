import 'package:flutter/material.dart';
import '../model/furniture_item.dart';

class CartProvider with ChangeNotifier {
  final Map<FurnitureItem, int> _items = {};

  Map<FurnitureItem, int> get cartItems => _items;

  void addToCart(FurnitureItem item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(FurnitureItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void increaseQuantity(FurnitureItem item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }
    notifyListeners();
  }

  void decreaseQuantity(FurnitureItem item) {
    if (_items.containsKey(item)) {
      final currentQty = _items[item]!;
      _items[item] = currentQty > 0 ? currentQty - 1 : 0;
      notifyListeners();
    }
  }

  bool isInCart(FurnitureItem item) {
    return _items.containsKey(item);
  }

  int getQuantity(FurnitureItem item) {
    return _items[item] ?? 0;
  }

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.entries.fold(
      0.0,
      (sum, entry) => sum + entry.key.price * entry.value,
    );
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
