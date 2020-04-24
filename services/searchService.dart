
import 'package:cloud_firestore/cloud_firestore.dart';


class SearchService{
searchbyName(String searchField) {

    return Firestore.instance.collection('mess')
    .where('seachkey', isEqualTo: searchField.substring(0,1).toUpperCase()).getDocuments();
  }
}