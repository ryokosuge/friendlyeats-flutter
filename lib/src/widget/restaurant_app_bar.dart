import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/model/restaurant.dart';
import 'package:friendlyeats_flutter/src/widget/star_rating.dart';

class RestaurantAppBar extends StatelessWidget {
  static final double appBarHeight = 160;

  final Restaurant? _restaurant;
  final CloseRestaurantPressedCallback _onPressed;

  const RestaurantAppBar(
      {Key? key,
      Restaurant? restaurant,
      required CloseRestaurantPressedCallback onPressed})
      : _restaurant = restaurant,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: _onPressed,
        icon: Icon(Icons.close),
        iconSize: 32,
      ),
      expandedHeight: appBarHeight,
      forceElevated: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Wrap(
          children: <Widget>[
            Text(
              _restaurant?.name ?? "-",
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80,
                  alignment: Alignment.bottomLeft,
                  child: StarRating(
                    rating: _restaurant?.avgRating ?? 0,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    '\$' * (_restaurant?.price ?? 1),
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.caption?.fontSize,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                '${_restaurant?.category} ● ${_restaurant?.city}',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.caption?.fontSize,
                ),
              ),
            )
          ],
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              _restaurant?.photo ?? "",
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color(0x00000000),
                    const Color(0xAA000000)
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
