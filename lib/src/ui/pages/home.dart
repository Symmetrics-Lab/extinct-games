import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './explore.dart';
import './animal_list.dart';
import './trivia.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extinct Games'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: RaisedButton(
              color: Colors.cyanAccent,
              onPressed: () {
                Navigator.of(context).pushNamed(Explore.routeName);
              },
              child: Text(
                'Explore',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 200,
            child: RaisedButton(
              color: Colors.cyanAccent,
              onPressed: () {
                Navigator.of(context).pushNamed(AnimalList.routeName);
              },
              child: Text(
                'Endangered species',
                style: TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 200,
            child: RaisedButton(
              color: Colors.cyanAccent,
              onPressed: () {
                Navigator.of(context).pushNamed(Trivia.routeName);
              },
              child: Text(
                'Trivia',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 200,
            child: RaisedButton(
              color: Colors.redAccent,
              onPressed: _launchURL,
              child: Text(
                'Donate to WWF',
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

void _launchURL() async {
  const url =
      'https://support.worldwildlife.org/site/SPageServer?pagename=main_monthly';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
