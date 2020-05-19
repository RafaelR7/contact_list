import 'package:contact_list/app/models/contact_model.dart';
import 'package:contact_list/app/stores/contact_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({this.contact});
  final ContactModel contact;

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.contact != null) {
      _nameController = TextEditingController(text: widget.contact.name);
      _phoneController = TextEditingController(text: widget.contact.phone);
      _addressController = TextEditingController(text: widget.contact.address);
    }
    bool isEdit = widget.contact != null ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Editar Contato' : 'Novo Contato'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o Nome';
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe o Telefone';
                      }
                      return null;
                    },
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe o Endereço';
                      }
                      return null;
                    },
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Endereço',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: RaisedButton(
                      child: Text(
                        isEdit ? 'Editar' : 'Adicionar',
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          ContactModel contact = ContactModel()
                            ..name = _nameController.text
                            ..phone = _phoneController.text
                            ..address = _addressController.text;

                          if (isEdit) {
                            contact.documentReference =
                                widget.contact.documentReference;
                          }

                          final ContactListStore _contactListStore =
                              ContactListStore();
                          _contactListStore.saveContact(contact: contact);
                          contactAddedDialog(context: context, isEdit: isEdit);
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dialog Box
  Future<bool> contactAddedDialog({BuildContext context, bool isEdit}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                isEdit ? Text('Contado Editado') : Text('Contato Adicionado'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pushNamed(context, '/contactList');
                },
              )
            ],
          );
        });
  }
}
