import 'package:flutter/material.dart';

import '../models.dart';

class Post extends StatelessWidget {
  final PostModel post;

  const Post({
    Key key,
    @required this.post,
  })  : assert(post != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        post.avatar,
        width: 60.0,
        height: 60.0,
      ),
      title: Text(post.body),
    );
  }
}
