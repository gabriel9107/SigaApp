import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

import 'package:flutter/services.dart';

class DBProvider {
  Future<Database> initializeDB() async {
    var databasesPath = await getDatabasesPath();
    var path2 = join(databasesPath, "Siga.db");

//verifico si existe la base de datosvar
    var exists = await databaseExists(path2);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path2)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "Siga.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path2).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

// open the database
// db = await openDatabase(path2, readOnly: true);

    String path = await getDatabasesPath();

    print(path2);
    //Crear la abse de datos
    return openDatabase(
      join(path, 'Siga.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }
}
// return await openDatabase(path, version: 2, onOpen: (db) {},
//     onCreate: (db, version) async {
// await db.execute('''
//   CREATE TABLE Produc(
//     id INTEGER PRIMARY KEY,
//     nombre TEXT,
//     codigo TEXT,
//     descripcion TEXT
//       //   )''');
//     });
//   }
// }
