import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/pages/restaurant_page.dart';
import 'pages/home_page.dart';

class FriendlyEatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FriendlyEats",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RestaurantPage.route:
            final RestaurantPageArguments arguments =
                settings.arguments as RestaurantPageArguments;
            return MaterialPageRoute(
                builder: (context) => RestaurantPage(
                      restaurantId: arguments.id,
                    ));
          default:
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
        }
      },
    );
  }
}
