import 'dart:math';
import 'package:flutter/material.dart';

import './values.dart';

typedef RestaurantPressedCallback = void Function(String restaurantId);
typedef CloseRestaurantPressedCallback = void Function();

class Restaurant {
  final String? id;
  final String name;
  final String category;
  final String city;
  final double avgRating;
  final int numRatings;
  final int price;
  final String photo;

  Restaurant._(
      {required this.name,
      required this.category,
      required this.city,
      required this.price,
      required this.photo})
      : id = null,
        numRatings = 0,
        avgRating = 0;

  factory Restaurant.random() {
    return Restaurant._(
        name: getRandomName(),
        category: getRandomCategory(),
        city: getRandomCity(),
        price: Random().nextInt(3) + 1,
        photo: getRandomPhoto());
  }
}
