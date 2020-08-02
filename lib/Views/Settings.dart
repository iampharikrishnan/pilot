import 'package:flutter/cupertino.dart'
    show
        BuildContext,
        Key,
        ListView,
        Row,
        State,
        StatefulWidget,
        Text,
        VoidCallback,
        Widget;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Key,
        ListTile,
        ListView,
        Row,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        VoidCallback,
        Widget;

import '../Authentication.dart';

class MySettingsWidget extends StatefulWidget {
  //final bool darkThemeEnabled;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  const MySettingsWidget({Key key, this.auth, this.logoutCallback, this.userId})
      : super(key: key);

  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettingsWidget> {
//  bool _darkModeEnabled = false;
//
//  void _checkIfDarkModeEnabled() {
//    final ThemeData theme = Theme.of(context);
//    theme.brightness == Brightness.light
//        ? _darkModeEnabled = true
//        : _darkModeEnabled = false;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          Row(
            children: [
              ListTile(
                title: Text("Dark Theme"),
              )
            ],
          )
        ],
      ),
    );
  }

  switchTheme() {}
}
