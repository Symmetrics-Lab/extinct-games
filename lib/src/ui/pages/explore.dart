import 'package:flutter/material.dart';

import '../../models/region.dart';
import '../pages/map_show.dart';

List<Region> regions = [
  Region(id: 0, image: 'assets/africa.png', name: 'AFRICA'),
  Region(id: 1, image: 'assets/north-america.png', name: 'NORTH AMERICA'),
  Region(id: 2, image: 'assets/central-america.png', name: 'CENTRAL AMERICA'),
  Region(id: 3, image: 'assets/south-america.png', name: 'SOUTH AMERICA'),
  Region(id: 5, image: 'assets/asia.png', name: 'ASIA'),
  Region(id: 4, image: 'assets/europe.png', name: 'EUROPE'),
  Region(id: 6, image: 'assets/australia.png', name: 'AUSTRALIA'),
];

class Explore extends StatelessWidget {
  static const routeName = '/explore';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildCarousel(context),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 24,
        ),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: MediaQuery.of(context).size.height * 0.8 -
              kBottomNavigationBarHeight,
          child: PageView.builder(
            itemCount: regions.length,
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, regions[itemIndex]);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, Region region) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          // image: DecorationImage(
          //   image: AssetImage(region.image),
          //   fit: BoxFit.fitWidth,
          // ),
        ),
        child: MapShow(
          thisRegion: region,
        ),
      ),
    );
  }
}
