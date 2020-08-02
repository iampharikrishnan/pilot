import 'package:flutter/material.dart';
import 'package:pilot/Authentication.dart';
import 'package:pilot/RootPage.dart';

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
