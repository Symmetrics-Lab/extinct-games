import 'dart:ui';

import 'package:flutter/material.dart';

import '../../logic/providers/animal_provider.dart';

class AnimalCard extends StatelessWidget {
  static const routeName = '/animal';
  final int animalIndex;

  const AnimalCard({Key key, this.animalIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var animal = AnimalProvider().getAnimal(animalIndex);
    return Scaffold(
      appBar: AppBar(),
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
                      animal.name,
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
                      animal.sciName,
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
                  image: NetworkImage(animal.heroImageName),
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
                          animal.endangerment,
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
                      animal.description,
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
                    Text(animal.location),
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
