import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_list/app/models/contact_model.dart';

class ContractListRepository {
  final String collectionContatos = 'contatos';

  Stream<List<ContactModel>> fetchContactList() {
    return Firestore.instance
        .collection(collectionContatos)
        .orderBy('name')
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return ContactModel.fromDocument(doc);
      }).toList();
    });
  }

  saveContact(ContactModel contact) async {
    if (contact.documentReference == null) {
      contact.documentReference = await Firestore.instance
          .collection(collectionContatos)
          .add({
        'name': contact.name,
        'phone': contact.phone,
        'address': contact.address
      });
    } else {
      contact.documentReference.updateData({
        'name': contact.name,
        'phone': contact.phone,
        'address': contact.address
      });
    }
  }

  deleteContact(ContactModel contact) {
    return contact.documentReference.delete();
  }
}
