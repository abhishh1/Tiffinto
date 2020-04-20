import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OwnersPhoto extends StatelessWidget {
  Widget imagesGrid() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return ImageGridItem(index + 1);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SizedBox(height: 250.0, child: imagesGrid()),
      ),
    );
  }
}

class ImageGridItem extends StatefulWidget {
  int _index;

  ImageGridItem(int index) {
    this._index = index;
  }
  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  Uint8List imageFile;
  StorageReference photosRef = FirebaseStorage.instance.ref().child('owner');
  int MAX_SIZE = 8 * 1024 * 1024;
  getImage() {
    photosRef
        .child("image_${widget._index}.png")
        .getData(MAX_SIZE)
        .then((data) {
      this.setState(() {
        imageFile = data;
      });
    }).catchError((error) {});
  }

  decideGridTile() {
    if (imageFile == null) {
      return SpinKitChasingDots(
        color: Colors.lightBlueAccent,
      );
    } else {
      return Image.memory(
        imageFile,
        fit: BoxFit.fill,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridTile());
  }
}
