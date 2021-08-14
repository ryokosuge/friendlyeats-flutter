import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double? size;
  final Color? color;

  StarRating({required this.rating, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      starCount: 5,
      allowHalfRating: true,
      rating: rating,
      color: color,
      borderColor: color,
      size: size,
      isReadOnly: true,
    );
  }
}
