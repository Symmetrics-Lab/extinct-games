import 'package:flutter/material.dart';

// Pages
import 'src/ui/pages/home.dart';
import 'src/ui/pages/animal_card.dart';
import 'src/ui/pages/map_show.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extinct Games',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      onGenerateRoute: (settings) {
        if (settings.name == AnimalCard.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return AnimalCard(
                animalIndex: settings.arguments,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
