import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tugas_getx_movie/models/moviemodel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return await openDatabase(
      path,
      version: 2, // Versi database harus 2 atau lebih tinggi
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE favorites(
            title TEXT PRIMARY KEY, 
            imageUrl TEXT, 
            genre TEXT,
            age INTEGER,        -- Pastikan kolom age ada di sini
            director TEXT,      -- Tambahkan kolom director
            rating REAL         -- Tambahkan kolom rating
          )
          '''
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Tambahkan kolom baru jika database diupgrade ke versi 2
          await db.execute("ALTER TABLE favorites ADD COLUMN age INTEGER");
          await db.execute("ALTER TABLE favorites ADD COLUMN director TEXT");
          await db.execute("ALTER TABLE favorites ADD COLUMN rating REAL");
        }
      },
    );
  }

  Future<void> insertFavorite(Movie movie) async {
    try {
      final db = await database;
      await db.insert(
        'favorites',
        movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error inserting favorite: $e");
    }
  }

  Future<List<Movie>> getFavorites() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('favorites');
      return List.generate(maps.length, (i) {
        return Movie.fromMap(maps[i]);
      });
    } catch (e) {
      print("Error fetching favorites: $e");
      return [];
    }
  }

  Future<void> removeFavorite(String title) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'title = ?',
      whereArgs: [title],
    );
  }
}
