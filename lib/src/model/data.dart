import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friendlyeats_flutter/src/model/filter.dart';
import 'package:friendlyeats_flutter/src/model/restaurant.dart';
import 'package:friendlyeats_flutter/src/model/review.dart';

Future<void> addRestaurant(Restaurant restaurant) {
  final restaurants = FirebaseFirestore.instance.collection("restaurants");
  return restaurants.add({
    'avgRating': restaurant.avgRating,
    'category': restaurant.category,
    'city': restaurant.city,
    'name': restaurant.name,
    'numRatings': restaurant.numRatings,
    'photo': restaurant.photo,
    'price': restaurant.price,
  });
}

Stream<QuerySnapshot<Map<String, dynamic>>> loadAllRestaurants() {
  return FirebaseFirestore.instance
      .collection('restaurants')
      .orderBy('avgRating', descending: true)
      .limit(50)
      .snapshots();
}

List<Restaurant> getRestaurantsFromQuery(
    QuerySnapshot<Map<String, dynamic>> snapshot) {
  return snapshot.docs
      .map((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return Restaurant.fromSnapshot(documentSnapshot);
  }).toList();
}

Future<Restaurant?> getRestaurant(String restaurantId) {
  return FirebaseFirestore.instance
      .collection('restaurants')
      .doc(restaurantId)
      .get()
      .then((value) => Restaurant.fromSnapshot(value));
}

Future<void> addReview({required String restaurantId, required Review review}) {
  // TODO: Complete the "Write data in a transaction" step.
  return Future.value();
}

Stream<QuerySnapshot<Map<String, dynamic>>?> loadFilteredRestaurants(
    Filter filter) {
  // TODO: Complete the "Sorting and filtering data" step.
  return Stream<QuerySnapshot<Map<String, dynamic>>?>.value(null);
}

void addRestaurantsBatch(List<Restaurant> restaurants) {
  restaurants.forEach((Restaurant restaurant) {
    addRestaurant(restaurant);
  });
}
