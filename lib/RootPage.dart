import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/CustomWidgets/Logo.dart';
import 'package:pilot/Pages/Settings.dart';

import 'Authentication.dart';
import 'Pages/Home.dart';
import 'Pages/Login.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  // Widget shown before app is opened showing our logo as a banner(for promotion purpose)
  Widget preLoginBanner() {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: [Logo().logoOnly()],
        ),
      ),
    );
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  Widget router() {
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomeWidget(
              userId: _userId,
              auth: widget.auth,
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/settings': (context) => MySettingsWidget(
              userId: _userId,
              auth: widget.auth,
              logoutCallback: logoutCallback,
            ),
      },
    );
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return preLoginBanner();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginPage(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return router();
        } else
          return preLoginBanner();
        break;
      default:
        return preLoginBanner();
    }
  }
}
