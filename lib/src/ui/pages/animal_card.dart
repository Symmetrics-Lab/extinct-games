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
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: animal.name,
              child: Container(
                height: 300.0,
                width: width,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth >= width) {
                    return Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black54,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  animal.name,
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 32,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  animal.sciName,
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                }),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    image: NetworkImage(animal.heroImageName),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.black54,
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
                      'Places',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(animal.location),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Facts',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      animal.description,
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
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
