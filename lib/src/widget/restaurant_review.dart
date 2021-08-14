import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/model/review.dart';
import 'star_rating.dart';

class RestaurantReview extends StatelessWidget {
  RestaurantReview({required Review review}) : _review = review;

  final Review _review;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                        style: BorderStyle.solid))),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _review.userName,
                      style: Theme.of(context).textTheme.caption,
                    )),
                    StarRating(rating: _review.rating, size: 16),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text(_review.text),
                    ))
                  ],
                )
              ],
            )));
  }
}
