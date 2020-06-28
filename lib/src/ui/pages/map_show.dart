import 'dart:math';

import 'package:flutter/material.dart';
import '../../models/animals.dart';
import '../../logic/providers/animal_provider.dart';
import 'dart:async';

//key to get sizing
GlobalKey _thiskey = GlobalKey();
//widget list for stack
List<Widget> stackList = [
  Image.asset(
    'assets/worldmap.jpg',
    key: _thiskey,
  ),
];
//Pre drawing
List<Animal> listToDraw = AnimalProvider().animals;
//List<Animal> listToDraw = [];

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

//hotfix, dont accumulate double initializations
bool drawFlag = true;
void preDraw(_) {
  final RenderBox renderBoxRed = _thiskey.currentContext.findRenderObject();
  final sizeWidget = renderBoxRed.size;
  print('SIZE of widget: $sizeWidget');
  final positionWidget = renderBoxRed.localToGlobal(Offset.zero);
  print('POSITION of widget: $positionWidget ');
  //position+size*animal
  if (sizeWidget.height > 0 && sizeWidget.width > 0 && drawFlag) {
    listToDraw.forEach(
      (element) {
        var ttop = positionWidget.dy + sizeWidget.height * element.y;
        var lleft = positionWidget.dx + sizeWidget.width * element.x;
        var xx = sizeWidget.height; // * element.x;
        var yy = sizeWidget.width; // * element.y;
        print('$ttop - $lleft');
        print('$xx > $yy');
        print(sizeWidget);
        stackList.add(
          Positioned(
            top: ttop,
            left: lleft,
            child: mapMarkerAlt(),
          ),
        );
      },
    );
    drawFlag = false;
  }
  ;
}

class MapShow extends StatefulWidget {
  @override
  _MapShowState createState() => _MapShowState();
  //void onLoad(BuildContext context) {
  //preDraw(1);
//  } //callback when layout build done
}

class _MapShowState extends State<MapShow> {
  //onLoad callback
  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback(preDraw);
    super.initState();
    Timer(Duration(milliseconds: 2000), () {
      //Dirty hotfix: cant get the view to get the drawing size on init callback, just wait enough or tap it
      print('timer');
      setState(() {});
    });
  }

  //widget.onLoad(context);
  //on build callback
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(alignment: Alignment.center, children: stackList),
      onTapDown: (TapDownDetails details) {
        print('onTapDown');
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
        print('$localx - $localy');
        referenceList.forEach((element) {
          var distance =
              sqrt(pow(localx - element.x, 2) + pow(localy - element.y, 2));
          if (distance < closestDistance) {
            closestDistance = distance;
            closestPick = element;
          }
        });
        var pickName = closestPick.name;
        print('$closestDistance - $pickName');
        if (closestDistance < threshold) {
          //logic to show an animal card
        }
        //Drawing position: absolute
        setState(() {
          stackList.add(Positioned(top: y, left: x, child: mapMarker()));
        });
      },
    );
  }
}
