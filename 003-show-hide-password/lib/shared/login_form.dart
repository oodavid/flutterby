import 'package:flutter/material.dart';

import '../shared/password_form_field.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              PasswordFormField(
                controller: _passwordController,
              ),
              RaisedButton(
                onPressed: () {
                  _validateAndSubmit(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndSubmit(BuildContext context) {
    // Do nothing with an invalid form
    if (!_formKey.currentState.validate()) {
      return;
    }
    // Show a snackBar
    final snackBar = SnackBar(
      content: Text('Your password is "${_passwordController.text}"'),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
