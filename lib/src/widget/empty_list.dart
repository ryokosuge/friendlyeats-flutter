import 'package:flutter/material.dart';

typedef EmptyListActionButtonCallback = void Function();

class EmptyListView extends StatelessWidget {
  EmptyListView(
      {required Widget child, required EmptyListActionButtonCallback onPress})
      : _child = child,
        _onPressed = onPress;

  final Widget _child;
  final EmptyListActionButtonCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var imageSize = 600.0;
    if (screenWidth < 640 || screenHeight < 820) {
      imageSize = 300.0;
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: imageSize,
            height: imageSize,
            child: Image.asset('assets/friendlyeater.png'),
          ),
          _child,
          ElevatedButton(onPressed: _onPressed, child: Text("ADD SOME"))
        ],
      ),
    );
  }
}
