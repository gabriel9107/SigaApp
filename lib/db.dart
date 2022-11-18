import 'package:flutter_application_2/customer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'customers.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE customer (Id INTEGER PRIMERAY KEY, CustomerCode TEXT,   CustomerName TEXT,    CustomerDir TEXT,    Phone1 TEXT,    Phon2 TEXT,    ShippingMth TEXT,    VendorCode TEXT)");
    }, version: 1);
  }

  static Future<int> insert(customer customer) async {
    Database database = await _openDB();

    return database.insert("customer", customer.toMap());
  }

  static Future<int> delete(customer customer) async {
    Database database = await _openDB();

    return database
        .delete("customer", where: "id = ?", whereArgs: [customer.Id]);
  }

  static Future<int> update(customer customer) async {
    Database database = await _openDB();
    return database.update("customer", customer.toMap(),
        where: "id = ?", whereArgs: [customer.Id]);
  }

  static Future<List<customer>> customers() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> customerMap =
        await database.query("customer");

    return List.generate(
        customerMap.length,
        (index) => customer(
            Id: customerMap[index]['Id'],
            CustomerCode: customerMap[index]['CustomerCode'],
            CustomerDir: customerMap[index]['CustomerDir'],
            CustomerName: customerMap[index]['CustomerName'],
            Phon2: customerMap[index]['Phon2'],
            Phone1: customerMap[index]['Phone1'],
            VendorCode: customerMap[index]['VendorCode'],
            ShippingMth: customerMap[index]['ShippingMth']));
  }
}
