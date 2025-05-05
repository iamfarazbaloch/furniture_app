import 'package:flutter/material.dart';
import '../model/furniture_item.dart';

class FurnitureProvider with ChangeNotifier {
  final List<FurnitureItem> _items = [
    FurnitureItem(
      name: 'Modern Chair',
      image: 'assets/images/chair1.png',
      price: 120.0,
      description: 'Comfortable and stylish modern chair.',
      review: 4.5,
    ),
    FurnitureItem(
      name: 'Wooden Table',
      image: 'assets/images/table1.png',
      price: 250.0,
      description: 'Elegant wooden table for your dining room.',
      review: 4.8,
    ),
    // Add more items as needed
  ];

  List<FurnitureItem> get items => _items;
}
