import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

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
  final DocumentReference? reference;

  Restaurant._(
      {required this.name,
      required this.category,
      required this.city,
      required this.price,
      required this.photo})
      : id = null,
        numRatings = 0,
        avgRating = 0,
        reference = null;

  Restaurant.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        name = snapshot.data()?["name"],
        category = snapshot.data()?["category"],
        city = snapshot.data()?["city"],
        avgRating = (snapshot.data()?["avgRating"] as int).toDouble(),
        numRatings = snapshot.data()?["numRatings"],
        price = snapshot.data()?["price"],
        photo = snapshot.data()?["photo"],
        reference = snapshot.reference;

  factory Restaurant.random() {
    return Restaurant._(
        name: getRandomName(),
        category: getRandomCategory(),
        city: getRandomCity(),
        price: Random().nextInt(3) + 1,
        photo: getRandomPhoto());
  }
}
