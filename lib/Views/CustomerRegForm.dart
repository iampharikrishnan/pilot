import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BuildContext,
        Column,
        Container,
        Form,
        FormState,
        GlobalKey,
        Icon,
        IconButton,
        Icons,
        InputDecoration,
        Navigator,
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextField,
        Widget;

class FormsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'New Customer';

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.done,
            ),
            tooltip: 'Save',
            onPressed: () => null,
          ),
        ],
      ),
      body: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  Widget textBox(
    String label, {
    String hint: "",
  }) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          //style: KLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        )
      ],
    );
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and RaisedButton here.
          textBox('Customer Name'),
          textBox('Contact Number'),
          textBox('Device Name'),
          textBox('Device Model'),
          textBox('Device Number'),
        ]));
  }
}
