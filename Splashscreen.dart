import 'dart:async';
import 'package:app4/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50.0,
                        child: Icon(FontAwesomeIcons.shoppingBasket),
                        foregroundColor: Colors.blueAccent),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Transform.rotate(
                      angle: 0.0,
                      child: Text(
                        "T I F F I N T O",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontFamily: 'Rockdiz',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitChasingDots(
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: new Text(
                        'Beta version',
                        style: new TextStyle(
                            color: Colors.black, fontFamily: 'Bangers'),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
