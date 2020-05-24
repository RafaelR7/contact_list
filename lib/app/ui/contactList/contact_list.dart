import 'package:contact_list/app/i18n/i18n.dart';
import 'package:contact_list/app/models/contact_model.dart';
import 'package:contact_list/app/stores/contact_list_store.dart';
import 'package:contact_list/app/ui/contactList/contact_details.dart';
import 'package:contact_list/app/ui/contactList/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactListStore _contactListStore = ContactListStore();
    _contactListStore.getContactList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${I18n.of(context).contactList}",
          style: TextStyle(fontFamily: 'Montserrat'),
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
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          _contactListStore.contactList.data[index].name[0]
                              .toUpperCase(),
                        ),
                      ),
                      title: Text(
                        _contactListStore.contactList.data[index].name,
                      ),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactDetails(
                                contact:
                                    _contactListStore.contactList.data[index]),
                          ),
                        )
                      },
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
}
