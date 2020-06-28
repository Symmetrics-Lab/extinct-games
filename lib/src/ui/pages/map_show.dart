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
  //void onLoad(BuildContext context) {
  //preDraw(1);
//  } //callback when layout build done
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

//function to create mapmaker
  Container mapMarker() {
    return Container(
      width: 10,
      height: 10,
      color: Colors.red,
    );
  }

  Container mapMarkerAlt() {
    return Container(
      width: 10,
      height: 10,
      color: Colors.blue,
    );
  }

//hotfix, don't accumulate double initializations
  // bool drawFlag = true;
  void preDraw(_) {
    print('Step 1');
    final RenderBox renderBoxRed = _thiskey.currentContext.findRenderObject();
    final sizeWidget = renderBoxRed.size;
    //print('SIZE of widget: $sizeWidget');
    final positionWidget = renderBoxRed.localToGlobal(Offset.zero);
    //print('POSITION of widget: $positionWidget ');
    //position+size*animal
    print(sizeWidget);

    if (sizeWidget.height > 0 && sizeWidget.width > 0) {
      print('Step 2');
      listToDraw.forEach(
        (element) {
          if (element.regionID == refRegion.id) {
            print('Step 3');
            var ttop = sizeWidget.height * element.y;
            var lleft = sizeWidget.width * element.x;
            // var xx = sizeWidget.height; // * element.x;
            // var yy = sizeWidget.width; // * element.y;
            //print('$ttop - $lleft');
            //print('$xx > $yy');
            //print(sizeWidget);
            stackList.add(
              Positioned(
                top: ttop,
                left: lleft,
                child: mapMarkerAlt(),
              ),
            );
            setState(() {
              stackList = stackList;
            });
          }
          ;
        },
      );
      // drawFlag = false;
    }
    ;
  }

  //onLoad callback
  @override
  void initState() {
    print('init');
    // WidgetsBinding.instance.addPersistentFrameCallback(preDraw);
    super.initState();
    // Timer(Duration(milliseconds: 2000), () {
    //   //Dirty hotfix: cant get the view to get the drawing size on init callback, just wait enough or tap it
    //   print('timer');
    //   setState(() {});
    // });
  }

  //widget.onLoad(context);
  //on build callback
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
    refRegion = widget.thisRegion; //this is wrong
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            preDraw(0);
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
            // String pickName = closestPick.name;
            //print('$closestDistance - $pickName');
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
            //Drawing position: absolute
            setState(() {
              //stackList.add(Positioned(top: y, left: x, child: mapMarker()));
            });
          },
        ),
      ],
    );
  }
}
