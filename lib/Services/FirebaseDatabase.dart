import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase {
  //This link to firebase collection. If the collection does not exist it create collection for us.
  final CollectionReference order = Firestore.instance.collection('Order');
}
