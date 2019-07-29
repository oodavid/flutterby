import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('oodavid :: Flutterby'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Flutterby',
                style: Theme.of(context).textTheme.display1,
              ),
              SizedBox(height: 8.0),
              CircleAvatar(
                backgroundImage: AssetImage('img/me.jpg'),
                radius: MediaQuery.of(context).size.width / 4,
              ),
              SizedBox(height: 8.0),
              Text(
                'Take a look at the git repo. Each directory contains source code for my YouTube videos.',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              FlutterLogo(
                size: MediaQuery.of(context).size.width / 3,
              ),
              SizedBox(height: 8.0),
              Text(
                'Thanks for cloning!',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
