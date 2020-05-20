import 'package:flutter/material.dart';

class I18n {
  I18n(this.locale);

  final Locale locale;

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'contactList': 'Contact List',
      'newContact': 'New Contact',
      'name': 'Name',
      'phone': 'Phone',
      'address': 'Address',
      'add': 'Add',
      'enterTheName': 'Enter the name',
      'enterThePhone': 'Enter the phone',
      'enterTheAddress': 'Enter the address',
      'editContact': 'Edit Contact',
      'edit': 'Edit',
      'contactAdded': 'Contact Added',
      'contactEdited': 'Contact Edited',
      'yes': 'Yes',
      'no': 'No',
      'deleteContact': 'Delete Contact?',
    },
    'pt': {
      'contactList': 'Lista de Contatos',
      'newContact': 'Novo Contato',
      'name': 'Nome',
      'phone': 'Telefone',
      'address': 'Endereço',
      'add': 'Adicionar',
      'enterTheName': 'Infome o nome',
      'enterThePhone': 'Informe o telefone',
      'enterTheAddress': 'Informe o endereço',
      'editContact': 'Editar Contato',
      'edit': 'Editar',
      'contactAdded': 'Contato Adicionado',
      'contactEdited': 'Contato Editado',
      'yes': 'Sim',
      'no': 'Não',
      'deleteContact': 'Excluir Contato?',
    }
  };

  String get contactList =>
      _localizedValues[locale.languageCode]['contactList'];
  String get newContact => _localizedValues[locale.languageCode]['newContact'];
  String get name => _localizedValues[locale.languageCode]['name'];
  String get address => _localizedValues[locale.languageCode]['address'];
  String get phone => _localizedValues[locale.languageCode]['phone'];
  String get add => _localizedValues[locale.languageCode]['add'];
  String get enterTheName =>
      _localizedValues[locale.languageCode]['enterTheName'];
  String get enterThePhone =>
      _localizedValues[locale.languageCode]['enterThePhone'];
  String get enterTheAddress =>
      _localizedValues[locale.languageCode]['enterTheAddress'];
  String get editContact =>
      _localizedValues[locale.languageCode]['editContact'];
  String get edit => _localizedValues[locale.languageCode]['edit'];
  String get contactAdded =>
      _localizedValues[locale.languageCode]['contactAdded'];
  String get contactEdited =>
      _localizedValues[locale.languageCode]['contactEdited'];
  String get yes => _localizedValues[locale.languageCode]['yes'];
  String get no => _localizedValues[locale.languageCode]['no'];
  String get deleteContact =>
      _localizedValues[locale.languageCode]['deleteContact'];
}
