import 'package:flutter/material.dart';
import 'pages/home.dart';

class FriendlyEatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FriendlyEats",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
    );
  }
}
