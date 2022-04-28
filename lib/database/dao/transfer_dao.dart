import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

// It needs to Implement //
class TransferDao {
  static const String tableSql =
      'CREATE TABLE transfer(id INTEGER PRIMARY KEY, value DECIMAL(6,2), account_number INTEGER)';

  Future<int> saveContact(Contact contact) async {
    final Database db = await getDataBase();
    final Map<String, dynamic> contactsMap = {};
    contactsMap['name'] = contact.name;
    contactsMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactsMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contacts = [];
    for (Map<String, dynamic> map in result) {
      final Contact contact = Contact(
        map['id'],
        map['name'],
        map['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
