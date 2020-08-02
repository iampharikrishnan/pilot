import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Colors,
        Container,
        EdgeInsets,
        FlatButton,
        FontWeight,
        Form,
        FormState,
        GlobalKey,
        Icon,
        Icons,
        InputDecoration,
        Key,
        ListView,
        OutlineInputBorder,
        Padding,
        RaisedButton,
        RoundedRectangleBorder,
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextFormField,
        TextInputType,
        TextStyle,
        VoidCallback,
        Widget;
import 'package:pilot/Authentication.dart';
import 'package:pilot/CustomWidgets/Logo.dart' show Logo;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.auth, this.loginCallback}) : super(key: key);

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();
  bool _isLoading;
  String _email, _password;

  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  void logIn() async {
    final _formstate = _formKey.currentState;
    if (_formstate.validate()) {
      _formstate.save();
      setState(() {
        _isLoading = true;
      });
      String userId = "";
      try {
        userId = await widget.auth.signIn(_email, _password);
        print('Signed in: $userId');
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _formstate.reset();
        });
      }
    }
  }

//  Future<void> signIn() async {
//    final _formstate = _formKey.currentState;
//    if (_formstate.validate()) {
//      _formstate.save();
//      try {
//        AuthResult user = await FirebaseAuth.instance
//            .signInWithEmailAndPassword(email: _email, password: _password);
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => MyHomeWidget()));
//      } catch (e) {
//        print(e.message);
//      }
//    }
//  }

  Widget showErrorMessage(String _errorMessage) {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      //initialValue: 'alucard@gmail.com',
      onSaved: (value) => _email = value.trim(),
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  Widget password() {
    return TextFormField(
      autofocus: false,
      //initialValue: 'some password',
      onSaved: (value) => _password = value.trim(),
      obscureText: true,
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          prefixIcon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          logIn();
          //Navigator.of(context).pushNamed(Home.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget forgotPassword() {
    return FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: new Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Logo().logoOnly(),
              SizedBox(height: 48.0),
              email(),
              SizedBox(height: 8.0),
              password(),
              SizedBox(height: 24.0),
              loginButton(),
              forgotPassword(),
              showErrorMessage(""),
            ],
          ),
        ),
      ),
    );
  }
}
