import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/model/filter.dart';
import 'package:friendlyeats_flutter/src/widget/empty_list.dart';
import 'package:friendlyeats_flutter/src/widget/filter_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  Filter? _filter;

  Future<void> _onFilterBarPressed() async {}
  Future<void> _onAddRandomRestaurantsPressed() async {}

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
              : EmptyListView(
                  child: Text("FriendlyEats has no restaurants yet!"),
                  onPress: _onAddRandomRestaurantsPressed),
        ),
      ),
    );
  }
}