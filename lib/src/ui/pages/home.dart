import 'package:flutter/material.dart';

import '../../logic/providers/animal_provider.dart';

class Home extends StatelessWidget {
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
                  trailing: FilterChip(
                      label: Text(animal.endangerment), onSelected: null),
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
