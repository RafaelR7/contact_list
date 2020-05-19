import 'package:contact_list/app/models/contact_model.dart';
import 'package:contact_list/app/stores/contact_list_store.dart';
import 'package:contact_list/app/ui/contactList/contact_form.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  final ContactModel contact;
  ContactDetails({this.contact});

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final ContactListStore _contactListStore = ContactListStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactForm(contact: widget.contact),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () =>
                deleteDialog(context: context, contact: widget.contact),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                padding: EdgeInsets.all(40.0),
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
                child: Center(
                  child: CircleAvatar(
                    radius: 40.0,
                    child: Text(
                      widget.contact.name[0],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              createListTile(
                  icon: Icons.account_box, text: widget.contact.name),
              createListTile(
                  icon: Icons.local_phone, text: widget.contact.phone),
              createListTile(
                  icon: Icons.location_on, text: widget.contact.address),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> deleteDialog({BuildContext context, ContactModel contact}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Excluir Contato?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Sim'),
              onPressed: () {
                _contactListStore.deleteContact(contact);
                Navigator.pushNamed(context, '/contactList');
              },
            ),
            FlatButton(
              child: Text('Não'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  ListTile createListTile({IconData icon, String text}) {
    return ListTile(
      leading: Icon(icon, size: 28.0),
      title: Text(
        text,
      ),
    );
  }
}
