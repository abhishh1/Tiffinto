import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Percent20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Percent20page(),
    );
  }
}

class Percent20page extends StatefulWidget {
  Percent20page({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Percent20page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('percent20').getDocuments();

    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  post: post,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/cooking.png'),
        backgroundColor: Colors.white,
        title: Text(
          "20% Discount!",
          style: TextStyle(
              fontFamily: 'Rockdiz', fontSize: 30.0, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SpinKitThreeBounce(color: Colors.deepOrangeAccent));
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Center(
                          child: new Card(
                              elevation: 10,
                              margin: const EdgeInsets.fromLTRB(
                                  10.0, 4.0, 10.0, 2.0),
                              child: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                           image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/new4e.jpg'
                                                ),fit: BoxFit.cover
                                              )),
                                      child: new ListTile(
                                        leading: Image.asset('assets/discount.png'),
                                        trailing: new Icon(Icons.shopping_basket),
                                        onTap: () => navigateToDetail(
                                            snapshot.data[index]),
                                        title: Text(
                                          snapshot.data[index].data['name'],
                                          style: new TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        subtitle: Text(
                                          snapshot.data[index].data['location'],
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        isThreeLine: false,
                                        dense: false,
                                      ),
                                    )
                                  ]))));
                });
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: FlatButton(
        child: Icon(Icons.arrow_drop_up),
        onPressed: () {},
      )),
    );
  }
}

//===============================================================================================
class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}
Completer<GoogleMapController> _controller = Completer();
const LatLng _center = const LatLng(21.1458, 79.0882);
void _onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
}


//title: Text(widget.post.data['offer_value']),
class _DetailPageState extends State<DetailPage> {
  void messPrice() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/new3.jpg'),
                      fit: BoxFit.fill)),
              height: 70.0,
              child: Center(
                child: SizedBox(
                  height: 80.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              widget.post.data['price'],
                              style: TextStyle(
                                  fontFamily: 'Rockdiz', fontSize: 40.0),
                            )),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  void messOwner() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.white])),
              height: 100.0,
              child: Center(
                child: SizedBox(
                  height: 80.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/chef.png'),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              widget.post.data['owner'],
                              style: TextStyle(
                                  fontFamily: 'Rockdiz', fontSize: 26.0),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SpinKitDoubleBounce(
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  //=========================================================================================================================
  //WeeklyFood
  void mondayFood() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/green.jpg'))),
              height: 100.0,
              child: Center(
                child: Card(
                  child: ListTile(
                    leading: Image.asset('assets/aalumatar.jpg'),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Dal Fry',
                        style:
                            TextStyle(fontFamily: 'Prestage', fontSize: 26.0),
                      ),
                    ),
                    trailing: Image.asset('assets/biryani.jpg'),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Aalu Matar',
                        style:
                            TextStyle(fontFamily: 'Prestage', fontSize: 26.0),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }

  void locationMap() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 1000.0,
              child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  leading: MaterialButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    "Tiffinto",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Soda",
                    ),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/bird.jpg'))),
                    child: SizedBox(
                      height: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 80.8),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                widget.post.data['name'],
                                style: TextStyle(
                                    fontFamily: "Rockdiz",
                                    fontSize: 30.0,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 340.0,
                    width: 500.0,
                    child: Container(
                      decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.darken,
                          color: Colors.black26,
                          image: DecorationImage(
                              image: AssetImage('assets/qq.jpg'),
                              fit: BoxFit.fitHeight)),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: FlatButton(
                                  color: Colors.black,
                                  child: Text('Sunday',
                                      style: TextStyle(
                                          fontFamily: 'Prestage',
                                          color: Colors.white)),
                                  onPressed: () => mondayFood()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: FlatButton(
                                color: Colors.black,
                                child: Text('Monday',
                                    style: TextStyle(
                                        fontFamily: 'Prestage',
                                        color: Colors.white)),
                                onPressed: () => mondayFood(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: FlatButton(
                                color: Colors.black,
                                child: Text('Tuesday',
                                    style: TextStyle(
                                        fontFamily: 'Prestage',
                                        color: Colors.white)),
                                onPressed: () => mondayFood(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: FlatButton(
                                color: Colors.black,
                                child: Text('Wednesday',
                                    style: TextStyle(
                                        fontFamily: 'Prestage',
                                        color: Colors.white)),
                                onPressed: () => mondayFood(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: FlatButton(
                                color: Colors.black,
                                child: Text('Thursday',
                                    style: TextStyle(
                                        fontFamily: 'Prestage',
                                        color: Colors.white)),
                                onPressed: () => mondayFood(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: FlatButton(
                                color: Colors.black,
                                child: Text('Friday',
                                    style: TextStyle(
                                        fontFamily: 'Prestage',
                                        color: Colors.white)),
                                onPressed: () => mondayFood(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: FlatButton(
                                  color: Colors.black,
                                  child: Text('Saturday',
                                      style: TextStyle(
                                          fontFamily: 'Prestage',
                                          color: Colors.white)),
                                  onPressed: () => mondayFood()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/new4.jpg'),
                              fit: BoxFit.fill)),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: MaterialButton(
                                onPressed: () {},
                                color: Colors.black,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              EvaIcons.person,
                                              color: Colors.white,
                                            ),
                                            MaterialButton(
                                              onPressed: () => messOwner(),
                                              child: Text(
                                                'Owner?',
                                                style: TextStyle(
                                                    fontFamily: 'Prestage',
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: MaterialButton(
                                onPressed: () {},
                                color: Colors.black,
                                child: Row(
                                  children: <Widget>[
                                    MaterialButton(
                                      onPressed: () => locationMap(),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Icon(
                                              Icons.map,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Location?',
                                            style: TextStyle(
                                                fontFamily: 'Prestage',
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 180.0),
                          child: Text(
                            "Special's",
                            style: TextStyle(
                                fontFamily: 'Prestage', fontSize: 16.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SpinKitChasingDots(
                            color: Colors.red,
                            size: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
//===============================================================================================================================

                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/new12e.png'),
                            fit: BoxFit.fitWidth)),
                    child: SizedBox(
                        height: 250.0,
                        width: 500.0,
                        child: Container(
                            height: 500.0,
                            child: Column(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 70.0, top: 25.0),
                                child: SizedBox(
                                  height: 200.0,
                                  width: 300.0,
                                  child: ListView.builder(
                                      physics: ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 1,
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          Row(
                                            children: <Widget>[
                                              Card(
                                                child: Center(
                                                    child: MaterialButton(
                                                  onPressed: () {
                                                    Scaffold.of(context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            content: Card(
                                                              child: ListTile(
                                                                leading:
                                                                    Image.asset(
                                                                        'assets/chef.png'),
                                                                title: Text(
                                                                  'Bhindi',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Soda',
                                                                      fontSize:
                                                                          20.0),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                subtitle: Text(
                                                                  'Rs : 70.0',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Soda'),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                seconds: 2)));
                                                  },
                                                  child: Image.asset(
                                                      'assets/sp1.jpg'),
                                                )),
                                              ),
                                              Card(
                                                child: MaterialButton(
                                                  child: Image.asset(
                                                      'assets/sp3.jpg'),
                                                  onPressed: () => {
                                                    Scaffold.of(context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            content: Card(
                                                              child: ListTile(
                                                                leading:
                                                                    Image.asset(
                                                                        'assets/chef.png'),
                                                                title: Text(
                                                                  'Aalu matar',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Soda',
                                                                      fontSize:
                                                                          20.0),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                subtitle: Text(
                                                                  'Rs : 70.0',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Soda'),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                seconds: 2)))
                                                  },
                                                ),
                                              ),
                                              Card(
                                                child: MaterialButton(
                                                  child: Image.asset(
                                                      'assets/sp2.jpg'),
                                                  onPressed: () => {
                                                    Scaffold.of(context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            content: Card(
                                                              child: ListTile(
                                                                leading:
                                                                    Image.asset(
                                                                        'assets/chef.png'),
                                                                title: Text(
                                                                  'Aalu matar',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Soda',
                                                                      fontSize:
                                                                          20.0),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                subtitle: Text(
                                                                  'Rs : 70.0',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Soda'),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                seconds: 2)))
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                ),
                              ),
                            ]))),
                  ),
                  SafeArea(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 180.0),
                          child: Text(
                            "Thali's",
                            style: TextStyle(
                                fontFamily: 'Prestage', fontSize: 16.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SpinKitChasingDots(
                            color: Colors.red,
                            size: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: SizedBox(
                        height: 250.0,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                                  children: <Widget>[
                                    Card(
                                      child: MaterialButton(
                                          child:
                                              Image.asset('assets/thali0.jpg'),
                                          onPressed: () {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: Card(
                                                      child: ListTile(
                                                        leading: Image.asset(
                                                            'assets/chef.png'),
                                                        title: Text(
                                                          'Masala korma',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda',
                                                              fontSize: 20.0),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        subtitle: Text(
                                                          'Rs : 80.0',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    duration:
                                                        Duration(seconds: 2)));
                                          }),
                                    ),
                                    Card(
                                      child: MaterialButton(
                                          child:
                                              Image.asset('assets/thali0.jpg'),
                                          onPressed: () {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: Card(
                                                      child: ListTile(
                                                        leading: Image.asset(
                                                            'assets/chef.png'),
                                                        title: Text(
                                                          'Masala korma',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda',
                                                              fontSize: 20.0),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        subtitle: Text(
                                                          'Rs : 80.0',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    duration:
                                                        Duration(seconds: 2)));
                                          }),
                                    ),
                                    Card(
                                      child: MaterialButton(
                                          child:
                                              Image.asset('assets/thali0.jpg'),
                                          onPressed: () {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: Card(
                                                      child: ListTile(
                                                        leading: Image.asset(
                                                            'assets/chef.png'),
                                                        title: Text(
                                                          'Masala korma',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda',
                                                              fontSize: 20.0),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        subtitle: Text(
                                                          'Rs : 80.0',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    duration:
                                                        Duration(seconds: 2)));
                                          }),
                                    ),
                                    Card(
                                      child: MaterialButton(
                                          child:
                                              Image.asset('assets/thali0.jpg'),
                                          onPressed: () {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: Card(
                                                      child: ListTile(
                                                        leading: Image.asset(
                                                            'assets/chef.png'),
                                                        title: Text(
                                                          'Masala korma',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda',
                                                              fontSize: 20.0),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        subtitle: Text(
                                                          'Rs : 80.0',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Soda'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    duration:
                                                        Duration(seconds: 2)));
                                          }),
                                    ),
                                  ],
                                ))),
                  ),
                  Container(
                    height: 80.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/new11.jpg'),
                            fit: BoxFit.fill)),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0),
                          child: FlatButton(
                            color: Colors.white,
                            onPressed: () {},
                            child: Icon(
                              Icons.call,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0),
                          child: FlatButton(
                            color: Colors.white,
                            onPressed: () => messPrice(),
                            child: Icon(FontAwesomeIcons.rupeeSign,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SafeArea(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 180.0),
                            child: Text(
                              "Messtraunt",
                              style: TextStyle(
                                  fontFamily: 'Prestage', fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SpinKitChasingDots(
                              color: Colors.redAccent,
                              size: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                        height: 250.0,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                                  children: <Widget>[
                                    Card(
                                      child: Center(
                                          child: MaterialButton(
                                        onPressed: () => {},
                                        child: Image.asset('assets/res1.jpg'),
                                      )),
                                    ),
                                    Card(
                                      child: MaterialButton(
                                        child: Image.asset('assets/res2.jpg'),
                                        onPressed: () => {},
                                      ),
                                    ),
                                    Card(
                                      child: MaterialButton(
                                        child: Image.asset('assets/res3.jpg'),
                                        onPressed: () => {},
                                      ),
                                    ),
                                  ],
                                ))),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 150.0),
                          child: Icon(Icons.local_cafe),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Tiffin Available',
                            style: TextStyle(
                                fontFamily: 'Prestage', fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SafeArea(
                      child: Text(
                        'Feedback please?',
                        style:
                            TextStyle(fontFamily: 'Prestage', fontSize: 16.0),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/new9.jpg'),
                            fit: BoxFit.cover)),
                    height: 100,
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText:
                                '                                                   Comment here',
                            hintStyle: TextStyle(fontFamily: 'Prestage')),
                      ),
                    ),
                  )
                ])))));
  }
}
