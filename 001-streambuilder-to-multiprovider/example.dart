/// 0 - Example `Streams`
Stream<MyUserModel> userStream => FirebaseAuth
  .instance
  .onAuthStateChanged
  .map((user) => MyUserModel.fromFirebase(user));

String documentPath = 'my/document';
Stream<MyDocumentModel> documentStream = Firestore.instance
    .document(documentPath)
    .snapshots()
    .map((snapshot) => MyDocumentModel.fromFirebase(snapshot));



/// 1 - `StreamBuilder`
///
/// `BigWidget` has a huge Widget tree that re-builds with every snapshot
/// ...and we only need to access `document` in one place!
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MyDocumentModel>(
      stream: documentStream,
      builder: (BuildContext context, AsyncSnapshot<MyDocumentModel> documentSnapshot) {
        MyDocumentModel document = documentSnapshot.data;
        return BigWidget(
          // ...huge widget tree
          child: Text(document.title)
        );
      },
    );
  }
}



/// 2 - `StreamProvider` + `Consumer` Child
///
/// The `Consumer` widget can sit anywhere below the `StreamProvider`
/// ...since it's a direct child, this is equivilent to above
/// ...notice that we don't have to extract the data from the snapshot!
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyDocumentModel>.value(
      value: documentStream,
      child: Consumer<MyDocumentModel>(
        builder: (context, MyDocumentModel document) {
          return BigWidget(
            // ...huge widget tree
            child: Text(document.title),
          );
        },
      ),
    );
  }
}



/// Why choose a different approach?
///    "You don’t want to rebuild large portions of the UI just because some detail somewhere changed."
///    https:///flutter.dev/docs/development/data-and-backend/state-mgmt/simple#consumer



/// 3 - `StreamProvider` + Deep `Consumer`
///
/// By using the `Consumer` widget deep within the widget tree
/// ...we don't have to re-build the entire `BigWidget` just because
/// ...a subwidget needs to re-build
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyDocumentModel>.value(
      value: documentStream,
      child: BigWidget(
        // ...huge widget tree
        child: Consumer<MyDocumentModel>(
          builder: (context, MyDocumentModel document) {
            return Text(document.title);
          }
        );
      ),
    );
  }
}



/// 4 - `StreamProvider` + Extracted Widget
///
/// We can still use `Consumer` when our child Widget has been extracted
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyDocumentModel>.value(
      value: documentStream,
      child: BigWidget(
        // ...huge widget tree
        child: TitleWidget(),
      ),
    );
  }
}
class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyDocumentModel>(
      builder: (context, MyDocumentModel document) {
        return Text(document.title);
      }
    );
  }
}



/// 5 - Multiple `StreamProviders` + Multiple `Consumers`
///
/// What about when we want to use multiple providers?
/// ...we can use nested `Providers` and `Consumers` to create
/// ...and access the data - it is ugly.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyDocumentModel>.value(
      value: documentStream,
      child: StreamProvider<MyUserModel>.value(
        value: userStream,
        child: BigWidget(
          // ...huge widget tree
          child: TitleWidget(),
        ),
      ),
    );
  }
}
class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyDocumentModel>(
      builder: (context, MyDocumentModel document) {
        return Consumer<MyUserModel>(
          builder: (context, MyUserModel user) {
            return Text('${user.name} ${document.title}');
          }
        );
      }
    );
  }
}



/// 6 - `MultiProvider` + Multiple `Consumers`
///
/// The first thing we can do, is use a `MultiProvider`
/// ...to group our providers up
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<MyDocumentModel>.value(value: documentStream),
        StreamProvider<MyUserModel>.value(value: userStream),
      ],
      child: BigWidget(
        // ...huge widget tree
        child: TitleWidget(),
      ),
    );
  }
}
class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyDocumentModel>(
      builder: (context, MyDocumentModel document) {
        return Consumer<MyUserModel>(
          builder: (context, MyUserModel user) {
            return Text('${user.name} ${document.title}');
          }
        );
      }
    );
  }
}



//// 7 - `MultiProvider` + `Provider.of`
////
//// Use `Provider.of` instead of `Consumer` to 
//// remove the rats-nest within our child Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<MyDocumentModel>.value(value: documentStream),
        StreamProvider<MyUserModel>.value(value: userStream),
      ],
      child: BigWidget(
        // ...huge widget tree
        child: TitleWidget(),
      ),
    );
  }
}
class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyDocumentModel document = Provider.of<MyDocumentModel>(context);
    MyUserModel user = Provider.of<MyUserModel>(context);
    return Text('${user.name} ${document.title}');
  }
}