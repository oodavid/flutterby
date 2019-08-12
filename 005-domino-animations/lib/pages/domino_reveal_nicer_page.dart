import 'package:flutter/material.dart';

import '../shared/domino_reveal.dart';

class DominoRevealNicerPage extends StatelessWidget {
  DominoRevealNicerPage({Key key}) : super(key: key);
  
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
            DominoReveal(child: FlutterLogo(size: 100)),
            SizedBox(height: 16),
            DominoReveal(
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      DominoReveal(child: Text('Domino Animations', style: Theme.of(context).textTheme.title)),
                      SizedBox(height: 16),
                      DominoReveal(child: Text('...are really easy to use!!', style: Theme.of(context).textTheme.title)),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          DominoReveal(child: Icon(Icons.favorite)),
                          DominoReveal(child: Icon(Icons.share)),
                          DominoReveal(child: Icon(Icons.refresh)),
                          DominoReveal(child: Icon(Icons.layers)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
