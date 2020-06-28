import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pages
import 'src/ui/pages/animal_card.dart';
import 'src/ui/pages/animal_list.dart';
import 'src/ui/pages/explore.dart';
import 'src/ui/pages/home.dart';
import 'src/ui/pages/trivia.dart';
import 'src/logic/providers/question_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: QuestionProvider(),
      ),
    ],
    child: MyApp(),
  ));
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
      routes: {
        AnimalList.routeName: (ctx) => AnimalList(),
        Explore.routeName: (ctx) => Explore(),
        Trivia.routeName: (ctx) => Trivia(),
      },
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
