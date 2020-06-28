import 'package:flutter/material.dart';

import './explore.dart';
import './animal_list.dart';
import './trivia.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save the planet'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Explore.routeName);
            },
            child: Text('Explore'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AnimalList.routeName);
            },
            child: Text('Endangered species'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Trivia.routeName);
            },
            child: Text('Trivia'),
          ),
        ],
      )),
    );
  }
}
