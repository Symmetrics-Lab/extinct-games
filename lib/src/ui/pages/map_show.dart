import 'dart:math';

import 'package:flutter/material.dart';
import '../../models/animals.dart';
import '../../models/region.dart';
import '../../logic/providers/animal_provider.dart';
import './animal_card.dart';

class MapShow extends StatefulWidget {
  final Region thisRegion;

  MapShow({Key key, this.thisRegion}) : super(key: key);
  @override
  _MapShowState createState() => _MapShowState();
}

class _MapShowState extends State<MapShow> {
  //key to get sizing
  final GlobalKey _thiskey = GlobalKey();
//widget list for stack
  List<Widget> stackList = [];
//Pre drawing
  List<Animal> listToDraw = AnimalProvider().animals;
// region ID
  Region refRegion;

  Container mapMarkerAlt(Animal animal, int index) {
    return Container(
      width: 48,
      height: 48,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (BuildContext context, Animation<double> animation,
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
        child: Hero(
          tag: animal.name,
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(animal.thumbnailImage),
            ),
          ),
        ),
      ),
    );
  }

  void preDraw() {
    final RenderBox renderBoxRed = _thiskey.currentContext.findRenderObject();
    final sizeWidget = renderBoxRed.size;

    if (sizeWidget.height > 0 && sizeWidget.width > 0) {
      listToDraw.forEach(
        (animal) {
          if (animal.regionID == widget.thisRegion.id) {
            print('Step 3');
            var ttop = sizeWidget.height * animal.y;
            var lleft = sizeWidget.width * animal.x;

            stackList.add(
              Positioned(
                top: ttop,
                left: lleft,
                child: mapMarkerAlt(animal, listToDraw.indexOf(animal)),
              ),
            );
            setState(() {
              stackList = stackList;
            });
          }
          ;
        },
      );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    if (stackList.isEmpty) {
      stackList.add(
        Image.asset(
          widget.thisRegion.image,
          key: _thiskey,
        ),
      );
    }
    // refRegion = widget.thisRegion; //this is wrong
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          widget.thisRegion.name,
          style: TextStyle(fontSize: 18, color: Colors.cyan),
        ),
        RaisedButton(
          onPressed: () {
            preDraw();
          },
          child: Text('Explore!'),
        ),
        GestureDetector(
          child: Stack(alignment: Alignment.center, children: stackList),
          onTapDown: (TapDownDetails details) {
            //print('onTapDown');
            var x = details.globalPosition.dx;
            var y = details.globalPosition.dy;
            print('$x - $y');
            final RenderBox renderBoxRed =
                _thiskey.currentContext.findRenderObject();
            final sizeWidget = renderBoxRed.size;
            final positionWidget = renderBoxRed.localToGlobal(Offset.zero);
            List referenceList = AnimalProvider().animals;
            Animal closestPick;
            var closestDistance = 99999.0;
            var threshold = 0.035;
            var localx = (x - positionWidget.dx) / sizeWidget.width;
            var localy = (y - positionWidget.dy) / sizeWidget.height;
            //print('$localx - $localy');
            referenceList.forEach((element) {
              var distance =
                  sqrt(pow(localx - element.x, 2) + pow(localy - element.y, 2));
              if (distance < closestDistance &&
                  element.regionID == widget.thisRegion.id) {
                closestDistance = distance;
                closestPick = element;
              }
            });

            if (closestDistance < threshold) {
              //logic to show an animal card
              //incompatible model HOTFIX, search for the correct index
              List fullList = AnimalProvider().animals;
              var indexToShow = 0;
              fullList.forEach((element) {
                if (element.name == closestPick.name) {
                  //print('gonna show $closestPick.name');
                  indexToShow = fullList.indexOf(element);
                }
              });
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1000),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return AnimalCard(
                      animalIndex: indexToShow,
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
