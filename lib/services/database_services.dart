import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import 'package:timely/models/actionmodel.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();
  static Database? _db;
  final String _actionsTableName = "actions";
  final String _idColumnName = "id";
  final String _nameColumnName = "title";
  final String _minsColumnName = "mins";
  final String _durationColumnName = "duration";
  final String _iconColumnName = "icons";
  final String _orderColumnName = "action_order";

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database =
        openDatabase(databasePath, version: 1, onCreate: (db, version) {
      db.execute('''
  CREATE TABLE $_actionsTableName (
   $_idColumnName TEXT PRIMARY KEY,
   $_nameColumnName TEXT NOT NULL,
   $_iconColumnName INTEGER NOT NULL,
   $_minsColumnName INTEGER NOT NULL,
   $_durationColumnName TEXT NOT NULL,
   $_orderColumnName INTEGER NOT NULL
  )
  ''');
      print("Table $_actionsTableName created successfully");
    });

    return database;
  }

  //Add item to the last of the list
  void addAction(ActionModel model, int index) async {
    final db = await database;
    final String id = model.id;
    final String name = model.name;
    final int mins = model.mins;
    final String duration = model.duration;
    final int icons = model.icon.codePoint;
    await db.insert(_actionsTableName, {
      _idColumnName: id,
      _nameColumnName: name,
      _durationColumnName: duration,
      _iconColumnName: icons,
      _minsColumnName: mins,
      _orderColumnName: index
    });
  }

  Future<List<ActionModel>> getActions() async {
    final db = await database;
    final data =
        await db.query(_actionsTableName, orderBy: "$_orderColumnName ASC");
    List<ActionModel> actions = data.map((e) {
      String id = e[_idColumnName] as String;
      String name = e[_nameColumnName] as String;
      String duration = e[_durationColumnName] as String;
      int mins = e[_minsColumnName] as int;
      int unicode = e[_iconColumnName] as int;
      IconData icons = IconData(unicode, fontFamily: 'MaterialIcons');
      final ActionModel model = ActionModel(
          id: id, name: name, duration: duration, mins: mins, icon: icons);
      return model;
    }).toList();
    return actions;
  }

  Future<void> deleteDatabaseIfNeeded() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");

    // Delete the database if it exists (for testing purposes)
    if (await databaseExists(databasePath)) {
      await deleteDatabase(databasePath);
      print("Deleted old database, will recreate on next app start.");
    }
  }

  Future<void> deleteAllRows() async {
    final db = await database;
    await db.delete(_actionsTableName);
  }

  Future<void> insertActionAtIndex(
    ActionModel newAction,
    int targetIndex,
  ) async {
    final db = await database;
    await db.rawUpdate('''
    UPDATE $_actionsTableName
    SET $_orderColumnName = $_orderColumnName + 1
    WHERE `$_orderColumnName` >= ?
  ''', [targetIndex]);

    await db.insert(_actionsTableName, {
      _idColumnName: newAction.id,
      _nameColumnName: newAction.name,
      _durationColumnName: newAction.duration,
      _minsColumnName: newAction.mins,
      _iconColumnName: newAction.icon.codePoint,
      'order': targetIndex, // Insert at the target index
    });
  }

  Future<void> removeActionAtIndex(int targetIndex) async {
    final db = await database;

    await db.transaction((txn) async {
      await txn.delete(
        _actionsTableName,
        where: '$_orderColumnName = ?',
        whereArgs: [targetIndex],
      );
      await txn.rawUpdate('''
      UPDATE $_actionsTableName
      SET $_orderColumnName = $_orderColumnName - 1
      WHERE action_order > ?
    ''', [targetIndex]);
    });
  }

  Future<void> updateActionOrder(String id, int newOrder) async {
    final db = await database;
    await db.update(
      _actionsTableName,
      {_orderColumnName: newOrder}, // Update the order column
      where: '$_idColumnName = ?',
      whereArgs: [id],
    );
  }
}
