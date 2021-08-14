import 'dart:math';
import './values.dart';

class Review {
  final String? id;
  final String userId;
  final String userName;
  final double rating;
  final String text;

  Review.fromUserInput(
      {required this.userId,
      required this.userName,
      required this.rating,
      required this.text})
      : id = null;

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
