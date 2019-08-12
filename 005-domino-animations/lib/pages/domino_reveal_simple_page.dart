import 'package:flutter/material.dart';

import '../shared/domino_reveal.dart';

class DominoRevealSimplePage extends StatelessWidget {
  DominoRevealSimplePage({Key key}) : super(key: key);

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
            DominoReveal(
              child: Text('One', style: Theme.of(context).textTheme.display1),
            ),
            DominoReveal(
              child: Text('Two', style: Theme.of(context).textTheme.display1),
            ),
            DominoReveal(
              child: Text('Three', style: Theme.of(context).textTheme.display1),
            ),
            DominoReveal(
              child: Text('Four', style: Theme.of(context).textTheme.display1),
            ),
            DominoReveal(
              child: Text('Five', style: Theme.of(context).textTheme.display1),
            ),
            DominoReveal(
              child: Text('Six', style: Theme.of(context).textTheme.display1),
            ),
          ],
        ),
      ),
    );
  }
}
