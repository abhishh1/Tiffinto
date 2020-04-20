import 'package:app4/services/auth.dart';
import 'package:app4/ui/Homepage.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? trial()
        : Scaffold(
            body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/wall2.jpg'), fit: BoxFit.fill)),
            padding: const EdgeInsets.only(top: 200.0, left: 50.0, right: 50.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Text(
                      'Fill those first!',
                      style: TextStyle(fontFamily: 'Rockdiz', fontSize: 30.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Umm..Email?',
                        hintStyle: TextStyle(fontFamily: 'Prestage')),
                    validator: (val) => val.isEmpty ? 'Enter a email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'And Password',
                        hintStyle: TextStyle(fontFamily: 'Prestage')),
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long '
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text(
                      'Leggo',
                      style: TextStyle(fontFamily: 'Prestage'),
                    ),
                    color: Colors.white,
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _authService
                            .signInWithEmailAndPassword(email, password);
                        if (result == null)
                          setState(() => error =
                              'Could not sign in with those credentials');
                        loading = false;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    error,
                    style: TextStyle(fontFamily: 'Prestage'),
                  )
                ],
              ),
            ),
          ));
  }
}
