import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  DocumentReference documentReference;
  String name;
  String phone;
  String address;

  ContactModel({
    this.documentReference,
    this.name,
    this.phone,
    this.address,
  });

  factory ContactModel.fromDocument(DocumentSnapshot doc) {
    return ContactModel(
      documentReference: doc.reference,
      name: doc['name'],
      phone: doc['phone'] ?? '',
      address: doc['address'] ?? '',
    );
  }

  @override
  String toString() {
    return "name: $name, phone: $phone, address: $address";
  }
}
