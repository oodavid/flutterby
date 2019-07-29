import 'package:flutter/material.dart';

import './posts_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Posts'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Posts'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostsPage()),
            );
          },
        ),
      ),
    );
  }
}
