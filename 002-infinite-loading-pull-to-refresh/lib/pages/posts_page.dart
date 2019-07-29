import 'package:flutter/material.dart';

import '../shared/posts.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Posts'),
      ),
      body: Posts(),
    );
  }
}
