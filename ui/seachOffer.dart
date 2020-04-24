import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app4/services/searchService.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var querySearchresult = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      querySearchresult = [];
      tempSearchStore = [];
    }

    var capitializedValue =
        value.substring(0, 1).toUpperCase() + value.subString(1);

    if (querySearchresult.length == 0 && value.length == 1) {
      SearchService().searchbyName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          querySearchresult.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      querySearchresult.forEach(
        (element) {
          if (element['location'].startsWith(capitializedValue)) {
            setState(() {
              tempSearchStore.add(element);
            });
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'SearchBox',
              style: TextStyle(fontFamily: 'Soda',color: Colors.black),
            )),
        body: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: SizedBox(
                child: ListView(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextField(
                      onChanged: (value) {
                        initiateSearch(value);
                      },
                      decoration: InputDecoration(
                          hoverColor: Colors.black26,
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 20.0,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          contentPadding: EdgeInsets.all(25.0),
                          hintText: 'Enter Location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))))),
              SizedBox(
                height: 10.0,
              ),
              GridView.count(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                mainAxisSpacing: 2.0,
                crossAxisCount: 4,
                primary: false,
                shrinkWrap: true,
                children: tempSearchStore.map((element) {
                  return buildResultCard(element);
                }).toList(),
              )
            ])),
          ),
        ));
  }
}

Widget buildResultCard(data) {
  return Container(
    child: Center(
      child: Text(
        data['location'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
    ),
  );
}
