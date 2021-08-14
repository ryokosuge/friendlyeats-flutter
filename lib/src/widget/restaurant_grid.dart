import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/model/restaurant.dart';
import 'package:friendlyeats_flutter/src/widget/restaurant_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

const double _minSpacingPx = 16;

const double _cardWidth = 360;

class RestaurantGrid extends StatelessWidget {
  RestaurantGrid(
      {required RestaurantPressedCallback onRestaurantPressed,
      required List<Restaurant> restaurants})
      : _onRestaurantPressed = onRestaurantPressed,
        _restaurants = restaurants;

  final RestaurantPressedCallback _onRestaurantPressed;
  final List<Restaurant> _restaurants;

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: math.min(
          _cardWidth, MediaQuery.of(context).size.width - (2 * _minSpacingPx)),
      minSpacing: _minSpacingPx,
      children: _restaurants
          .map((restaurant) => RestaurantCard(
              restaurant: restaurant, onPressed: _onRestaurantPressed))
          .toList(),
    );
  }
}
