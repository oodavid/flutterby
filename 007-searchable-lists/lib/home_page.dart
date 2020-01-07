import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searchable Lists'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Search Countries and Capitals',
                ),
                onChanged: (text){
                  print('$text');
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                // controller: scrollController,
                separatorBuilder: (context, index) => Divider(),
                itemCount: 100, // _snapshot.data.length + 1,
                itemBuilder: (BuildContext _context, int index) {
                  return Text(index.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
