import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';

  static const String tableSql = 'CREATE TABLE $_tableName('
      'id INTEGER PRIMARY KEY,'
      'name TEXT, account_number INTEGER);';

  Future<int> saveContact(Contact contact) async {
    final Database db = await getDataBase();
    Map<String, dynamic> contactsMap = _toMap(contact);
    return db.insert(_tableName, contactsMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactsMap = {};
    contactsMap['name'] = contact.name;
    contactsMap['account_number'] = contact.accountNumber;
    return contactsMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
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
