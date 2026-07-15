import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';
import 'user_repository.dart';

class SqliteUserRepository implements UserRepository {
  // Singleton: đảm bảo toàn bộ app chỉ dùng 1 instance & 1 kết nối DB duy nhất.
  static final SqliteUserRepository _instance = SqliteUserRepository._internal();
  factory SqliteUserRepository() => _instance;
  SqliteUserRepository._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullName TEXT NOT NULL,
        email TEXT NOT NULL,
        avatar TEXT NOT NULL
      )
    ''');
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final db = await database;
    final result = await db.query('users');
    return result.map((json) => UserModel.fromMap(json)).toList();
  }

  @override
  Future<void> addUser(UserModel user) async {
    final db = await database;
    final data = user.toMap();
    data.remove('id'); // Bỏ id để SQLite tự sinh AUTOINCREMENT
    await db.insert('users', data);
  }

  @override
  Future<void> updateUser(UserModel user) async {
    final db = await database;
    await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  @override
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
