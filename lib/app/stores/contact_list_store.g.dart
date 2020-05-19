// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactListStore on ContactListBase, Store {
  final _$contactListAtom = Atom(name: 'ContactListBase.contactList');

  @override
  ObservableStream<List<ContactModel>> get contactList {
    _$contactListAtom.context.enforceReadPolicy(_$contactListAtom);
    _$contactListAtom.reportObserved();
    return super.contactList;
  }

  @override
  set contactList(ObservableStream<List<ContactModel>> value) {
    _$contactListAtom.context.conditionallyRunInAction(() {
      super.contactList = value;
      _$contactListAtom.reportChanged();
    }, _$contactListAtom, name: '${_$contactListAtom.name}_set');
  }

  final _$getContactListAsyncAction = AsyncAction('getContactList');

  @override
  Future getContactList() {
    return _$getContactListAsyncAction.run(() => super.getContactList());
  }

  final _$ContactListBaseActionController =
      ActionController(name: 'ContactListBase');

  @override
  dynamic saveContact({ContactModel contact}) {
    final _$actionInfo = _$ContactListBaseActionController.startAction();
    try {
      return super.saveContact(contact: contact);
    } finally {
      _$ContactListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteContact(ContactModel contact) {
    final _$actionInfo = _$ContactListBaseActionController.startAction();
    try {
      return super.deleteContact(contact);
    } finally {
      _$ContactListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'contactList: ${contactList.toString()}';
    return '{$string}';
  }
}
