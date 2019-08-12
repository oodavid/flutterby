import 'package:flutter/material.dart';

import './delayed_reveal_page.dart';
import './domino_reveal_simple_page.dart';
import './domino_reveal_nicer_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Domino Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Simple Delayed Reveal Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DelayedRevealPage()),
                );
              },
            ),
            RaisedButton(
              child: Text('Domino Reveal Page (Simple)'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DominoRevealSimplePage()),
                );
              },
            ),
            RaisedButton(
              child: Text('Domino Reveal Page (Nicer UI)'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DominoRevealNicerPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
