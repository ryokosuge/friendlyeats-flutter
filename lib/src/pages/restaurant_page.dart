import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/model/restaurant.dart';
import 'package:friendlyeats_flutter/src/model/data.dart' as data;
import 'package:friendlyeats_flutter/src/widget/empty_list.dart';
import 'package:sliver_fab/sliver_fab.dart';

class RestaurantPage extends StatefulWidget {
  static const route = '/restaurant';

  final String _restaurantId;

  const RestaurantPage({Key? key, required String restaurantId})
      : _restaurantId = restaurantId,
        super(key: key);

  @override
  _RestaurantPageState createState() =>
      _RestaurantPageState(restaurantId: _restaurantId);
}

class _RestaurantPageState extends State<RestaurantPage> {
  bool _isLoading = true;
  Restaurant? _restaurant;
  String? _userId;
  String? _userName;

  _RestaurantPageState({required String restaurantId}) {
    FirebaseAuth.instance.signInAnonymously().then((UserCredential credential) {
      data.getRestaurant(restaurantId).then((Restaurant? restaurant) {
        setState(() {
          _restaurant = restaurant;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Builder(
              builder: (context) => SliverFab(
                slivers: <Widget>[
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyListView(
                        child: Text('${_restaurant?.name} has no reviews'),
                        onPress: () {}),
                  )
                ],
                floatingWidget: FloatingActionButton(
                  tooltip: 'Add a review.',
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.add),
                  onPressed: () {},
                ),
                floatingPosition: FloatingPosition(right: 16),
              ),
            ),
          );
  }
}

class RestaurantPageArguments {
  final String id;

  RestaurantPageArguments({required this.id});
}
