import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

import './values.dart';

class Review {
  final String? id;
  final String userId;
  final String userName;
  final double rating;
  final String text;

  final Timestamp? timestamp;
  final DocumentReference? reference;

  Review.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        userId = snapshot.data()?["userId"],
        userName = snapshot.data()?["userName"],
        rating = (snapshot.data()?["rating"] as int).toDouble(),
        text = snapshot.data()?["text"],
        timestamp = snapshot.data()?["timestamp"],
        reference = snapshot.reference;

  Review.fromUserInput(
      {required this.userId,
      required this.userName,
      required this.rating,
      required this.text})
      : id = null,
        timestamp = null,
        reference = null;

  factory Review.random({required String userId, required String userName}) {
    final rating = Random().nextInt(4) + 1;
    final review = getRandomReviewText(rating);
    return Review.fromUserInput(
        userId: userId,
        userName: userName,
        rating: rating.toDouble(),
        text: review);
  }
}
