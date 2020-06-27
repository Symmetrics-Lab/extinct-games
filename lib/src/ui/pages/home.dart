import 'package:flutter/material.dart';
import '../../animals.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save the planet'),
      ),
      body: Center(
        child: Text(allAnimals[0].sciName),
      ),
    );
  }
}
