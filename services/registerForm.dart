import 'package:app4/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
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
                    'Wanna join?',
                    style: TextStyle(fontFamily: 'Rockdiz', fontSize: 30.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email please!',
                      hintStyle: TextStyle(fontFamily: 'Prestage')),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password too',
                      hintStyle: TextStyle(fontFamily: 'Prestage')),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text(
                    'Join In',
                    style: TextStyle(fontFamily: 'Prestage'),
                  ),
                  color: Colors.white,
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _authService
                          .registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'please use a valid email');
                      }
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
