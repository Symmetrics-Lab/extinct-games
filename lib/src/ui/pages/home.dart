import 'package:flutter/material.dart';

import '../../logic/providers/animal_provider.dart';

import './animal_card.dart';

class Home extends StatelessWidget {
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
        title: Text('Save the planet'),
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
                      ? CircleAvatar(
                          child: ClipOval(
                            child: Image.network(animal.thumbnailImage),
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
                    Navigator.of(context)
                        .pushNamed(AnimalCard.routeName, arguments: index);
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
