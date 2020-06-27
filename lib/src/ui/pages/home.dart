import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save the planet'),
      ),
      body: Center(
        child: Text('There is no place like home!'),
      ),
    );
  }
}
