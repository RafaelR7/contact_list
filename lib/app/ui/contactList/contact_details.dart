import 'package:contact_list/app/i18n/i18n.dart';
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.purple, Colors.blue],
            ),
          ),
        ),
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.grey[600],
                      Colors.grey[700],
                      Colors.grey[800],
                    ],
                  ),
                ),
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
          title: Text('${I18n.of(context).deleteContact}'),
          actions: <Widget>[
            FlatButton(
              child: Text('${I18n.of(context).yes}'),
              onPressed: () {
                _contactListStore.deleteContact(contact);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/contactList', (Route<dynamic> route) => false);
              },
            ),
            FlatButton(
              child: Text('${I18n.of(context).no}'),
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
