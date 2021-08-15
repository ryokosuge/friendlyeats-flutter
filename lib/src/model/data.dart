import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friendlyeats_flutter/src/model/filter.dart';
import 'package:friendlyeats_flutter/src/model/restaurant.dart';
import 'package:friendlyeats_flutter/src/model/review.dart';

Future<void> addRestaurant(Restaurant restaurant) {
  // TODO: Complate the "Add restaurants to Firestore" step.
  return Future.value();
}

Stream<QuerySnapshot?> loadAllRestaurants() {
  // TODO: Complete the "Display data from Cloud Firestore" step.
  return Stream<QuerySnapshot?>.value(null);
}

List<Restaurant> getRestaurantsFromQuery(QuerySnapshot snapshot) {
  // TODO: Complete the "Display data from Cloud Firestore" step.
  return [];
}

Future<Restaurant?> getRestaurant(String restaurantId) {
  // TODO: Complete the "Get data" step.
  return Future<Restaurant?>.value(null);
}

Future<void> addReview({required String restaurantId, required Review review}) {
  // TODO: Complete the "Write data in a transaction" step.
  return Future.value();
}

Stream<QuerySnapshot?> loadFilteredRestaurants(Filter filter) {
  // TODO: Complete the "Sorting and filtering data" step.
  return Stream<QuerySnapshot?>.value(null);
}

void addRestaurantsBatch(List<Restaurant> restaurants) {
  restaurants.forEach((Restaurant restaurant) {
    addRestaurant(restaurant);
  });
}
