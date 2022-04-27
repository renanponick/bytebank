import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts/form.dart';
import 'package:flutter/material.dart';

import '../../components/item_list.dart';

const _tituloAppBar = 'Contatos';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: findAll(),
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
        _contacts.add(contact);
      });
    }
  }
}
