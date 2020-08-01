import 'package:flutter/material.dart';

import 'Authentication.dart';
import 'RootPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final bool darkThemeEnabled;

  //const MyApp({Key key, this.darkThemeEnabled}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme:
          ThemeData.dark().copyWith(accentColor: Colors.deepPurpleAccent),
      home: RootPage(auth: new Auth()),
    );
  }
}

//class MyThemeApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//      stream: bloc.darkThemeEnabled,
//      initialData: false,
//      builder: (context, snapshot) => MaterialApp(
//          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
//          home: MyApp(darkThemeEnabled: snapshot.data)),
//    );
//  }
//}
//
//class Bloc {
//  get _themeController => StreamController<bool>();
//  get changeTheme => _themeController.sink.add;
//  get darkThemeEnabled => _themeController.stream;
//}
//
//final bloc = Bloc();
