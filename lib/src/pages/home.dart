import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/model/data.dart' as data;
import 'package:friendlyeats_flutter/src/model/filter.dart';
import 'package:friendlyeats_flutter/src/model/restaurant.dart';
import 'package:friendlyeats_flutter/src/widget/empty_list.dart';
import 'package:friendlyeats_flutter/src/widget/filter_bar.dart';
import 'package:friendlyeats_flutter/src/widget/restaurant_grid.dart';

class HomePage extends StatefulWidget {
  static const route = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    FirebaseAuth.instance.signInAnonymously().then(
        (UserCredential credential) => {
              _currentSubscription =
                  data.loadAllRestaurants().listen(_updateRestaurants)
            });
  }

  StreamSubscription<QuerySnapshot?>? _currentSubscription;
  bool _isLoading = true;
  List<Restaurant> _restaurants = <Restaurant>[];
  Filter? _filter;

  void _updateRestaurants(QuerySnapshot? snapshot) {
    if (snapshot == null) {
      return;
    }
    setState(() {
      _isLoading = false;
      _restaurants = data.getRestaurantsFromQuery(snapshot);
    });
  }

  Future<void> _onFilterBarPressed() async {}

  Future<void> _onAddRandomRestaurantsPressed() async {
    final numReviews = Random().nextInt(10) + 20;
    final restaurants =
        List.generate(numReviews, (index) => Restaurant.random());
    data.addRestaurantsBatch(restaurants);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.restaurant),
        title: Text("FriendlyEats"),
        bottom: PreferredSize(
          preferredSize: Size(320, 48),
          child: Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 6, 4),
            child: FilterBar(
              onPressed: _onFilterBarPressed,
              filter: _filter,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1280),
          child: _isLoading
              ? CircularProgressIndicator()
              : _restaurants.isNotEmpty
                  ? RestaurantGrid(
                      onRestaurantPressed: (id) {
                        // TODO: Add deep links on web
                        Navigator.pushNamed(context, "");
                      },
                      restaurants: _restaurants)
                  : EmptyListView(
                      child: Text("FriendlyEats has no restaurants yet!"),
                      onPress: _onAddRandomRestaurantsPressed),
        ),
      ),
    );
  }
}
