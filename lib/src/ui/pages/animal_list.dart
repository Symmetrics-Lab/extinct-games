import 'package:flutter/material.dart';

import '../../logic/providers/animal_provider.dart';

import './animal_card.dart';

class AnimalList extends StatelessWidget {
  static const routeName = '/list';
  String getStatus(status) {
    switch (status) {
      case 'Critically Endangered':
        return 'CR';
      case 'Endangered':
        return 'EN';
      case 'Vulnerable':
        return 'VU';
      default:
        return 'NT';
    }
  }

  Color getStatusColor(status) {
    switch (status) {
      case 'Critically Endangered':
        return Colors.red;
      case 'Endangered':
        return Colors.amber;
      case 'Vulnerable':
        return Colors.yellowAccent;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endangered Species'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: AnimalProvider().animals.length,
          itemBuilder: (ctx, index) {
            var animal = AnimalProvider().animals[index];
            return Column(
              children: [
                ListTile(
                  leading: animal.thumbnailImage != ''
                      ? Hero(
                          tag: animal.name,
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.network(animal.thumbnailImage),
                            ),
                          ),
                        )
                      : CircleAvatar(),
                  title: Text(animal.name),
                  subtitle: Text(animal.sciName),
                  trailing: Chip(
                    label: Text(
                      getStatus(animal.endangerment),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: getStatusColor(animal.endangerment),
                  ),
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushNamed(AnimalCard.routeName, arguments: index);
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return AnimalCard(
                            animalIndex: index,
                          );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
