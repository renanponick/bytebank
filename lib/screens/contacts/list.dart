import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts/form.dart';
import 'package:flutter/material.dart';

import '../../components/item_list.dart';

const _tituloAppBar = 'Contatos';

class ContactsList extends StatefulWidget {
  final List<Contact> _contacts = [];

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
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._contacts.length,
        itemBuilder: (context, indice) {
          final contact = widget._contacts[indice];
          return Item(
            title: contact.name,
            subtitle: contact.number.toString(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormContact();
          })).then((transfer) {
            // Testar tempo de delay
            Future.delayed(Duration(seconds: 0), () {
              _atualiza(transfer);
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Contact? contact) {
    if (contact != null) {
      setState(() {
        widget._contacts.add(contact);
      });
    }
  }
}
