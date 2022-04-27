import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _createDB =
    'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER),'
    'CREATE TABLE transfer(id INTEGER PRIMARY KEY, value DECIMAL(6,2), account_number INTEGER)';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute(_createDB);
    }, version: 1);
  });
}

Future<int> saveContact(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactsMap = Map();
    contactsMap['name'] = contact.name;
    contactsMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactsMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
