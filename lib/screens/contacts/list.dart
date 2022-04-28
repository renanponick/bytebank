import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts/form.dart';
import 'package:flutter/material.dart';

import '../../components/item_list.dart';

const _tituloAppBar = 'Contatos';

class ContactsList extends StatefulWidget {
  ContactsList({Key? key}) : super(key: key);
  final ContactDao _dao = ContactDao();

  @override
  State<StatefulWidget> createState() {
    return ContactsListState();
  }
}

class ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: widget._dao.findAll(),
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.data as List<Contact>;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Loading'),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return Item(
                    title: contact.name,
                    subtitle: contact.accountNumber.toString(),
                  );
                },
              );
          }
          return const Text('Unknown Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => FormContact(),
              ))
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
