import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/data/models/car_model.dart';

class FirebaseCarDataSource{
  final FirebaseFirestore firestore;

  FirebaseCarDataSource(this.firestore);

  Future<List<Car>> getCars() async{
    var snapshot= await firestore.collection("cars").get();
    return snapshot.docs.map((doc)=>Car.fromJson(doc.data())).toList();
  }
}