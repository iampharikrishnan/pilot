import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Column,
        FloatingActionButton,
        GlobalKey,
        Hero,
        Icon,
        IconButton,
        Icons,
        Image,
        Key,
        Navigator,
        PageRouteBuilder,
        Route,
        Scaffold,
        ScaffoldState,
        StatelessWidget,
        Text,
        Widget;
import 'package:pilot/Authentication.dart' show BaseAuth;
import 'package:pilot/Pages/CustomerRegForm.dart' show FormsApp;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//void openSettings(BuildContext context) {
//  Navigator.push(context, MaterialPageRoute(
//    builder: (BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//          title: const Text('Settings'),
//        ),
//        body: const Center(
//          child: Text(
//            'This is the next page',
//            style: TextStyle(fontSize: 24),
//          ),
//        ),
//      );
//    },
//  ));
//}

Route newRecord() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FormsApp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

/// This is the stateless widget that the main application instantiates.
class MyHomeWidget extends StatelessWidget {
  MyHomeWidget({Key key, this.auth, this.userId}) : super(key: key);

  final BaseAuth auth;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Hero(
          tag: 'Hero',
          child: Image.asset('assets/Logo/InfinityLogoTextNoBackground.png'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              //scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Settings',
            onPressed: () {
              //Navigator.push(context, FormsApp())
              //openSettings(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
//      body: StreamBuilder(
//        stream: Firestore.instance.collection('path').snapshots(),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) return const Text('Loading..');
//          return Center(
//            child: Column(
//              children: <Widget>[
//                Text(
//                  'This is the home page',
//                ),
//              ],
//            ),
//          );
//        },
//      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'This is the home page',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(newRecord());
//          MyCustomForm().createState().build(context);
        },
        tooltip: 'New Record',
        child: Icon(Icons.add),
      ),
    );
  }
}
