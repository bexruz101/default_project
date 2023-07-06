import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/app_model.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("contacts.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${AppModelFields.productsTable} (
    ${AppModelFields.id} $idType,
    ${AppModelFields.name} $textType,
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<AppModelSql> insertContact(
      AppModelSql contactsModelSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        AppModelFields.productsTable, contactsModelSql.toJson());
    return contactsModelSql.copyWith(id: id);
  }

  static Future<List<AppModelSql>> getAllContacts() async {
    List<AppModelSql> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(AppModelFields.productsTable))
        .map((e) => AppModelSql.fromJson(e))
        .toList();

    return allToDos;
  }

  static updateContactName({required int id, required String name}) async {
    final db = await getInstance.database;
    db.update(
      AppModelFields.productsTable,
      {AppModelFields.name: name},
      where: "${AppModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  static updateContact({required AppModelSql contactsModelSql}) async {
    final db = await getInstance.database;
    db.update(
      AppModelFields.productsTable,
      contactsModelSql.toJson(),
      where: "${AppModelFields.id} = ?",
      whereArgs: [contactsModelSql.id],
    );
  }

  static deleteContact(int id) async {
    final db = await getInstance.database;
    db.delete(
      AppModelFields.productsTable,
      where: "${AppModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  static Future<List<AppModelSql>> getContactsByLimit(int limit) async {
    List<AppModelSql> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(AppModelFields.productsTable,
        limit: limit, orderBy: "${AppModelFields.name} ASC"))
        .map((e) => AppModelSql.fromJson(e))
        .toList();

    return allToDos;
  }

  static Future<AppModelSql?> getSingleContact(int id) async {
    List<AppModelSql> contacts = [];
    final db = await getInstance.database;
    contacts = (await db.query(
      AppModelFields.productsTable,
      where: "${AppModelFields.id} = ?",
      whereArgs: [id],
    ))
        .map((e) => AppModelSql.fromJson(e))
        .toList();

    if (contacts.isNotEmpty) {
      return contacts.first;
    }
  }

  static Future<List<AppModelSql>> getContactsByAlphabet(
      String order) async {
    List<AppModelSql> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(AppModelFields.productsTable,
        orderBy: "${AppModelFields.name} $order"))
        .map((e) => AppModelSql.fromJson(e))
        .toList();
    return allToDos;
  }

  static Future<List<AppModelSql>> getContactsByQuery(String query) async {
    List<AppModelSql> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(
      AppModelFields.productsTable,
      where: "${AppModelFields.name} LIKE ?",
      whereArgs: [query],
    ))
        .map((e) => AppModelSql.fromJson(e))
        .toList();
    return allToDos;
  }
}