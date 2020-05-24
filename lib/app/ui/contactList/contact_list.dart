import 'package:contact_list/app/i18n/i18n.dart';
import 'package:contact_list/app/models/contact_model.dart';
import 'package:contact_list/app/stores/contact_list_store.dart';
import 'package:contact_list/app/ui/contactList/contact_details.dart';
import 'package:contact_list/app/ui/contactList/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactListStore _contactListStore = ContactListStore();
    _contactListStore.getContactList();

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "${I18n.of(context).contactList}",
        ),
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
            key: Key('add_contact_button'),
            icon: const Icon(
              Icons.group_add,
            ),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactForm(
                    contact: null,
                  ),
                ),
              )
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          List<ContactModel> contactList = _contactListStore.contactList.data;
          if (contactList == null) {
            return Container();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: contactList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 80,
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.30,
                  secondaryActions: <Widget>[
                    Container(
                      height: 72,
                      child: IconSlideAction(
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => {
                          deleteDialog(
                              context: context,
                              contactListStore: _contactListStore,
                              contact: contactList[index]),
                        },
                      ),
                    ),
                  ],
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            contactList[index].name[0].toUpperCase(),
                          ),
                        ),
                        title: Text(
                          contactList[index].name,
                        ),
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ContactDetails(contact: contactList[index]),
                            ),
                          )
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<bool> deleteDialog({
    BuildContext context,
    ContactListStore contactListStore,
    ContactModel contact,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${I18n.of(context).deleteContact}'),
          actions: <Widget>[
            FlatButton(
              child: Text('${I18n.of(context).yes}'),
              onPressed: () {
                contactListStore.deleteContact(contact);
                Navigator.of(context).pop();
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
}
