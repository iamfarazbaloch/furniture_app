import 'package:flutter/material.dart';
import '../model/furniture_item.dart';

class FurnitureProvider with ChangeNotifier {
  final List<FurnitureItem> _items = [
    FurnitureItem(
      name: 'Black Simple Lamp',
      image: 'assets/images/lamp.png',
      price: 12.0,
      description:
          'Black simple lamp is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.',
      review: 200,
      rating: 4.5,
    ),
    FurnitureItem(
      name: 'Minimal Stand',
      image: 'assets/images/stand.png',
      price: 25.0,
      description:
          'Minimal stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.',
      review: 150,
      rating: 4.7,
    ),
    FurnitureItem(
      name: 'Coffee Chair',
      image: 'assets/images/chair.png',
      price: 20.0,
      description:
          'Coffee Chair is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.',
      review: 150,
      rating: 4.9,
    ),
    FurnitureItem(
      name: 'Simple Desk',
      image: 'assets/images/desk.png',
      price: 50.0,
      description:
          'Simple Desk is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.',
      review: 150,
      rating: 4.2,
    ),
  ];

  List<FurnitureItem> get items => _items;
}
