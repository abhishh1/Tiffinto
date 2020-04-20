import 'package:app4/MessTypes/Recom.dart';
import 'package:app4/PercentOff/Percent20.dart';
import 'package:app4/services/auth.dart';
import 'package:app4/ui/Map.dart';
import 'package:app4/ui/ownersphoto.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:app4/specials/specialsRice.dart';
import 'package:app4/specials/specialsRoti.dart';
import 'package:app4/specials/specialsSweets.dart';
import 'package:app4/specials/specialsAll.dart';
import 'package:app4/specials/specialsSabji.dart';
import 'package:app4/PercentOff/percent30.dart';
import 'package:app4/PercentOff/percent40.dart';
import 'package:app4/PercentOff/percent50.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app4/ui/seachOffer.dart';
import 'package:app4/ui/GeoMapRequester.dart';
import 'package:app4/MessTypes/NonVeg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:app4/MessTypes/Newlyopen.dart';
import 'package:app4/MessTypes/Local.dart';
import 'package:app4/MessTypes/Veg.dart';
import 'package:page_transition/page_transition.dart';

class trial extends StatelessWidget {
  const trial({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

//SPECIALS AND PERCENT OFF FUNCRIONS
//========================================================================================
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    void special1() {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              height: 500.0,
              child: SizedBox(
                height: 300.0,
                child: Special(),
              ),
            );
          });
    }

    void special2Sweets() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 800.0,
              child: SpecialSweets(),
            );
          });
    }

    void special3Roti() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 800.0,
              child: SpecialRoti(),
            );
          });
    }

    void special4Rice() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 800.0,
              child: SpecialRice(),
            );
          });
    }

    void specialAll() {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              height: 1500.0,
              child: SpecialAll(),
            );
          });
    }

    //========================================================================================

    void percent20() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 500.0,
              child: Percent20(),
            );
          });
    }

    void percent30() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 500.0,
              child: Percent30(),
            );
          });
    }

    void percent40() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 500.0,
              child: Percent40(),
            );
          });
    }

    void percent50() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 500.0,
              child: Percent50(),
            );
          });
    }

    //============================================================================================================
    void chicken() {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              child: new NonVeg(),
            );
          });
    }

    void veg() {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              child: new Veg(),
            );
          });
    }

    //===================================================================================
    void _searchMess() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
              child: Search(),
            );
          });
    }

//======================================================================================

//========================================================================================

//=======================================================================================
    void _geoMap() {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.only(top: 250.0),
              child: geomap(),
            );
          });
    }

    return AnimatedContainer(
        duration: Duration(seconds: 3),
        child: Container(
            child: Scaffold(
//===================================================================================

//======================================================================================

//================================================================================
          body: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: SizedBox(
                  height: 150.0,
                  child: new Image(
                    image: new AssetImage('assets/back2half1.jpg'),
                    color: Colors.black38,
                    colorBlendMode: BlendMode.darken,
                  )),
            ),
            Divider(
              color: Colors.black12,
            ),
            RichText(
              text: TextSpan(
                text: 'Choose ',
                style: TextStyle(
                    fontFamily: 'Prestage',
                    color: Colors.green,
                    fontSize: 20.0),
                children: <TextSpan>[
                  TextSpan(
                      text: 'your ', style: TextStyle(color: Colors.lightBlue)),
                  TextSpan(text: 'path', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: SizedBox(
                height: 110.0,
                width: 400.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) => Row(
                    children: <Widget>[
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        curve: Curves.easeIn,
                        child: Card(
                          child: Center(
                              child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .leftToRightWithFade,
                                      child: NonVeg()));
                            },
                            child: Image.asset(
                              'assets/chic.jpg',
                              fit: BoxFit.fill,
                            ),
                          )),
                        ),
                      ),
                      Card(
                        child: Center(
                            child: MaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: Veg()));
                          },
                          child: Image.asset('assets/paneer1.jpg'),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //===================================================================================
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 90,
                child: Container(
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/new1.jpg'),
                              fit: BoxFit.cover)),
                      child: ListTile(
                        title: Text(
                          "Don't be right!",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'Rockdiz',
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Mess it up :)',
                            style: TextStyle(
                                fontFamily: 'Soda', color: Colors.black),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                height: 50.0,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/wall3.jpg'),
                          fit: BoxFit.fitWidth)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Today's Specials",
                          style:
                              TextStyle(fontFamily: 'Prestage', fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 191.0),
                        child: FlatButton(
                          child:  RichText(
              text: TextSpan(
                text: 'View ',
                style: TextStyle(
                    fontFamily: 'Prestage',
                    color: Colors.green,
                    fontSize: 14.0),
                children: <TextSpan>[
                  TextSpan(
                      text: 'all ', style: TextStyle(color: Colors.lightBlue),)])),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.downToUp,
                                    child: SpecialAll()));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                  height: 100.0,
                  width: 400.0,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) => Row(
                            children: <Widget>[
                              Card(
                                child: MaterialButton(
                                  child: Image.asset('assets/sabji.jpg'),
                                  onPressed: () => special1(),
                                ),
                              ),
                              Card(
                                child: Center(
                                    child: MaterialButton(
                                  onPressed: () => special3Roti(),
                                  child: Image.asset('assets/roti.jpg'),
                                )),
                              ),
                              Card(
                                child: MaterialButton(
                                  child: Image.asset('assets/rice.jpg'),
                                  onPressed: () => special4Rice(),
                                ),
                              ),
                              Card(
                                child: MaterialButton(
                                  child: Image.asset('assets/sweets.jpg'),
                                  onPressed: () => special2Sweets(),
                                ),
                              ),
                            ],
                          ))),
            ),
            Divider(color: Colors.black),
            Card(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/new2.jpg'),
                        fit: BoxFit.cover)),
                child: ListTile(
                  title: Text(
                    "Offer's club",
                    style: TextStyle(fontFamily: 'Prestage', fontSize: 20.0),
                  ),
                  subtitle: Text(
                    "Yes for real!",
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Prestage'),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 55.0,
                width: 400.0,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) => Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 42.0),
                              child: ActionChip(
                                  label: Text(
                                    '20%',
                                    style: TextStyle(
                                        fontSize: 26.0, fontFamily: 'Rockdiz'),
                                  ),
                                  onPressed: () => percent20()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: ActionChip(
                                  label: Text(
                                    '30%',
                                    style: TextStyle(
                                        fontSize: 26.0, fontFamily: 'Rockdiz'),
                                  ),
                                  onPressed: () => percent30()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: ActionChip(
                                  label: Text(
                                    '40%',
                                    style: TextStyle(
                                        fontSize: 26.0, fontFamily: 'Rockdiz'),
                                  ),
                                  onPressed: () => percent40()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: ActionChip(
                                  label: Text(
                                    '50%',
                                    style: TextStyle(
                                        fontSize: 26.0, fontFamily: 'Rockdiz'),
                                  ),
                                  onPressed: () => percent50()),
                            ),
                          ],
                        ))),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                      child: Text(
                    "Featured thali's",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prestage',
                      fontSize: 20.0,
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 200.0,
                      width: 400.0,
                      child: Carousel(
                        images: [
                          Image.asset('assets/thali5.jpg'),
                          Image.asset('assets/thali1.jpg'),
                          Image.asset('assets/thali5.jpg'),
                          Image.asset('assets/thali1.jpg'),
                          Image.asset('assets/thali5.jpg'),
                          Image.asset('assets/thali1.jpg'),
                          Image.asset('assets/thali5.jpg'),
                        ],
                        radius: Radius.circular(25.0),
                        animationDuration: Duration(seconds: 1),
                        showIndicator: false,
                        animationCurve: Curves.ease,
                        dotBgColor: Colors.white.withOpacity(0.5),
                        borderRadius: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/new11e.jpg'),
                          fit: BoxFit.fitWidth)),
                  child: ListTile(
                    title: Text(
                      "Recommendations",
                      style: TextStyle(fontFamily: 'Prestage', fontSize: 20.0),
                    ),
                    subtitle: Text(
                      "have a look",
                      style: TextStyle(fontSize: 14.0, fontFamily: 'Prestage'),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SizedBox(
                height: 550.0,
                width: 400.0,
                child: StreamBuilder(
                    stream: Firestore.instance.collection('mess').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return CircularProgressIndicator(
                            backgroundColor: Colors.black);

                      return Recom();
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Text(
              'Top Owners',
              style: TextStyle(fontFamily: 'Rockdiz', fontSize: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 100.0,
                child: OwnersPhoto(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/newb.png'),
                        fit: BoxFit.fitWidth),
                  ),
                  child: ListTile(
                    title: Text(
                      "Newly opened",
                      style: TextStyle(fontFamily: 'Prestage', fontSize: 20.0),
                    ),
                    subtitle: Text(
                      "Check them out",
                      style: TextStyle(fontSize: 14.0, fontFamily: 'Prestage'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 550.0,
              width: 400.0,
              child: StreamBuilder(
                  stream:
                      Firestore.instance.collection('NewlyOpened').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return SpinKitPulse(color: Colors.greenAccent);
                    return Newlyopen();
                  }),
            ),
            Divider(color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/vovo.png'),
                          fit: BoxFit.fitWidth)),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 180.0),
                      child: Text(
                        "The under 100 tree",
                        style:
                            TextStyle(fontFamily: 'Prestage', fontSize: 20.0),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 180.0),
                      child: Text(
                        "Tap to know more",
                        style:
                            TextStyle(fontSize: 14.0, fontFamily: 'Prestage'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                  height: 150.0,
                  width: 400.0,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) => Row(
                            children: <Widget>[
                              Card(
                                child: MaterialButton(
                                  child: Image.asset('assets/thali5.jpg'),
                                  onPressed: () {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Card(
                                          child: ListTile(
                                            leading:
                                                Image.asset('assets/chef.png'),
                                            title: Text(
                                              "Palak ki sabji",
                                              style: TextStyle(
                                                  fontFamily: 'Soda',
                                                  fontSize: 20.0),
                                              textAlign: TextAlign.center,
                                            ),
                                            subtitle: Text(
                                              'Uncles courtyard',
                                              style:
                                                  TextStyle(fontFamily: 'Soda'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        action: SnackBarAction(
                                            label: 'Go', onPressed: () => {}),
                                        duration: Duration(seconds: 3)));
                                  },
                                ),
                              ),
                              Card(
                                child: MaterialButton(
                                  child: Image.asset('assets/thali5.jpg'),
                                  onPressed: () {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Card(
                                          child: ListTile(
                                            leading:
                                                Image.asset('assets/chef.png'),
                                            title: Text(
                                              "Aali kulcha",
                                              style: TextStyle(
                                                  fontFamily: 'Soda',
                                                  fontSize: 20.0),
                                              textAlign: TextAlign.center,
                                            ),
                                            subtitle: Text(
                                              'Abhishek mess',
                                              style:
                                                  TextStyle(fontFamily: 'Soda'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )));
                                  },
                                ),
                              ),
                              Card(
                                child: MaterialButton(
                                  child: Image.asset('assets/thali5.jpg'),
                                  onPressed: () {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Card(
                                          child: ListTile(
                                            leading:
                                                Image.asset('assets/chef.png'),
                                            title: Text(
                                              "Masala bhindi",
                                              style: TextStyle(
                                                  fontFamily: 'Soda',
                                                  fontSize: 20.0),
                                              textAlign: TextAlign.center,
                                            ),
                                            subtitle: Text(
                                              'PR Mess',
                                              style:
                                                  TextStyle(fontFamily: 'Soda'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        action: SnackBarAction(
                                            label: 'Go', onPressed: () => {}),
                                        duration: Duration(seconds: 3)));
                                  },
                                ),
                              ),
                            ],
                          ))),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 01.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/newa.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: ListTile(
                    title: Text(
                      "Local to you",
                      style: TextStyle(fontFamily: 'Prestage', fontSize: 20.0),
                    ),
                    subtitle: Text(
                      "Order thali?",
                      style: TextStyle(fontSize: 14.0, fontFamily: 'Prestage'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 550.0,
              width: 400.0,
              child: StreamBuilder(
                  stream: Firestore.instance.collection('Nearby').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      );
                    return Nearby_1();
                  }),
            ),
            Divider(
              color: Colors.black,
            ),

//BOTTOM BUTTONS===========================================================================================
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: FloatingActionButton(
                        child: Icon(Icons.map),
                        heroTag: "Tag4444",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GeoMap()));
                        })),

                /*async {
                        await _authService.signOut();
                      },
                      child: Icon(EvaIcons.logOut),
                      backgroundColor: Colors.green,
                      splashColor: Colors.redAccent,
                    )),*/
                Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: FloatingActionButton(
                        heroTag: 'tag14',
                        child: Icon(EvaIcons.globe2),
                        backgroundColor: Colors.pink,
                        onPressed: () => _geoMap())),
                Padding(
                    padding: const EdgeInsets.only(left: 90.0),
                    child: FloatingActionButton(
                        heroTag: 'tag13',
                        child: Icon(FontAwesomeIcons.search),
                        backgroundColor: Colors.deepOrangeAccent,
                        onPressed: () => _searchMess())),
              ],
            )
          ])),
        )));
  }
}
