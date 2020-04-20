import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoMap extends StatefulWidget {
  @override
  _GeoMapState createState() => _GeoMapState();
}

class _GeoMapState extends State<GeoMap> {
  Position position;
  Widget _child;
  GoogleMapController _controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    getcurrentlocation();
    populateClients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mapWidget());
  }

  void getcurrentlocation() async {
    Position res = await Geolocator().getCurrentPosition();

    setState(() {
      position = res;
      _child = mapWidget();
    });
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: Set<Marker>.of(markers.values),
      initialCameraPosition: CameraPosition(
          target: LatLng(position.latitude, position.longitude), 
          zoom: 16.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  populateClients() {
    Firestore.instance.collection('Veg').getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          initMarker(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  void initMarker(request, requestID) {
    var markerIDval = requestID;
    final MarkerId markerId = MarkerId(markerIDval);

    final Marker marker = Marker(
      markerId: markerId,
      position: 
          LatLng(request['location'].latitude, request['location'].longitude),
      infoWindow:
          InfoWindow(title: 'Tiffinto', snippet: request['name']),
    );
    setState(() {
      markers[markerId] = marker;
      print(markerId);
    });
  }
}
