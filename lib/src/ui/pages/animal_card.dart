import 'dart:ui';

import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 30,
                    right: 10,
                    child: Text(
                      'White Shark',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 48,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      'Carcharodon carcharias',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/white-shark.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.black87,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Vulnerable',
                          style: TextStyle(
                            color: Colors.red[200],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "The great white shark is the world's largest known predatory fish. It has 300 teeth, yet does not chew its food. Sharks rip their prey into mouth-sized pieces which are swallowed whole. The shark’s heavy, torpedo-shaped body allows it to cruise efficiently for long periods of time, and then suddenly switch to high speed bursts in pursuit of prey—sometimes leaping out of the water. It feeds on a broad spectrum of prey, from small fish, such as halibut, to large seals and dolphins.",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Places',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        'Gulf of California, Southern Chile, The Galápagos, Coastal East Africa'),
                    Text(
                      'Places',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        'Gulf of California, Southern Chile, The Galápagos, Coastal East Africa'),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
