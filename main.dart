import 'package:app4/models/user.dart';
import 'package:app4/services/auth.dart';
import 'package:app4/services/signInForm.dart';
import 'package:app4/ui/Homepage.dart';
import 'package:app4/ui/Splashscreen.dart';
import 'package:app4/ui/Notification.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(new MessedUp());

class MessedUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
              cursorColor: Colors.amberAccent,
              primarySwatch: Colors.red,
              brightness: Brightness.light,
              fontFamily: 'Ubuntu',
              accentColor: Colors.blueAccent),
          home: new trial()),
    );
  }

//====================================================================================================
}

//cliprrect for start button
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//=============================================================================================
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final AuthService _authService = AuthService();

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 700));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(fit: StackFit.expand, children: <Widget>[
          new Image(
            image: new AssetImage("assets/wall2.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "T I F F I N T O",
                  style: TextStyle(
                      fontFamily: 'Rockdiz',
                      fontSize: 55.0,
                      color: Colors.white),
                ),

                //=============================================================================

                Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: FloatingActionButton(
                      heroTag: "Tag4444",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => new SignInForm()));
                      },
                      child: Icon(FontAwesomeIcons.personBooth),
                      backgroundColor: Colors.black,
                      splashColor: Colors.redAccent,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0, left: 70.0),
                  child: SizedBox(
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: FloatingActionButton(
                              heroTag: "signInAnom",
                              onPressed: () async {
                                dynamic result =
                                    await _authService.signInAnom();
                                if (result == null) {
                                  print('Error SignIn');
                                } else {
                                  print('SignIn');
                                  print(result.uid);
                                }
                              },
                              child: Icon(Icons.featured_video),
                              backgroundColor: Colors.black,
                              splashColor: Colors.redAccent),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: FloatingActionButton(
                              heroTag: "Tag444a4",
                              onPressed: () {},
                              child: Icon(EvaIcons.google),
                              backgroundColor: Colors.black,
                              splashColor: Colors.redAccent,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: FloatingActionButton(
                              heroTag: "Tag3333",
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        new PushMessagingExample()));
                              },
                              child: Icon(FontAwesomeIcons.facebookF),
                              backgroundColor: Colors.black,
                              splashColor: Colors.redAccent,
                            )),
                      ],
                    ),
                  ),
                )
              ]),
        ]));
  }
}
