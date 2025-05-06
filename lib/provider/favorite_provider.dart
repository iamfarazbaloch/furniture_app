import 'package:flutter/material.dart';
import '../model/furniture_item.dart';

class FavoriteProvider with ChangeNotifier {
  final List<FurnitureItem> _favorites = [];

  List<FurnitureItem> get favorites => _favorites;

  void toggleFavorite(FurnitureItem item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(FurnitureItem item) {
    return _favorites.contains(item);
  }
}
