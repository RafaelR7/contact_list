import 'package:contact_list/app/models/contact_model.dart';
import 'package:contact_list/app/repositories/contact_list_repository.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_store.g.dart';

class ContactListStore = ContactListBase with _$ContactListStore;

abstract class ContactListBase with Store {
  ContractListRepository _contractListRepository = ContractListRepository();

  @observable
  ObservableStream<List<ContactModel>> contactList;

  @action
  getContactList() async {
    contactList = _contractListRepository.fetchContactList().asObservable();
  }

  @action
  saveContact({ContactModel contact}) {
    _contractListRepository.saveContact(contact);
  }

  @action
  deleteContact(ContactModel contact) {
    _contractListRepository.deleteContact(contact);
  }
}
