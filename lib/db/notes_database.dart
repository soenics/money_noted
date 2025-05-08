
// import 'package:money_noted/models/note.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:path/path.dart'; // Import the path package for the join method

// class NotesDatabase {
//   static final NotesDatabase instance = NotesDatabase._init();
//   static Database? _database;


//   NotesDatabase._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('notes.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final paths = join(dbPath, filePath);
//     return await openDatabase(
//       filePath,
//       version: 1,
//       onCreate: _createDB,
//     );
//   }

//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final boolType = 'BOOLEAN NOT NULL';
//     final intType = 'INTEGER NOT NULL';
//     final textType = 'TEXT NOT NULL';

//     await db.execute('''
//       CREATE TABLE $tableNote (
//         ${NoteFields.id} $idType,
//         ${NoteFields.isImportant} $boolType,
//         ${NoteFields.number} $intType,
//         ${NoteFields.title} $textType,
//         ${NoteFields.time} $textType,
//         ${NoteFields.description} $textType,
//         ${NoteFields.createTime} $textType
//       )
//     ''');
  
//   }
//   Future <Note> create(Note note) async {
//     final db = await instance.database;
//     final id = await db.insert(tableNote, note.toJson());
//     return note.copy(id: id);
//   }
//   Future <Note> readNote(int id) async {
//     final db = await instance.database;
//     final maps = await db.query(
//       tableNote,
//       columns: NoteFields.values,
//       where: '${NoteFields.id} = ?',
//       whereArgs: [id],
//     );
//     if (maps.isNotEmpty) {
//       return Note.fromJson(maps.first);
//     } else {
//       throw Exception('ID $id not found');
//     }
//   }
//   Future<List<Note>> readAllNotes() async {
//     final db = await instance.database;
//     final orderBy = '${NoteFields.createTime} ASC';
//     final result = await db.query(tableNote, orderBy: orderBy);
//     return result.map((json) => Note.fromJson(json)).toList();
//   }
//   Future<int> update(Note note) async {
//     final db = await instance.database;
//     return db.update(
//       tableNote,
//       note.toJson(),
//       where: '${NoteFields.id} = ?',
//       whereArgs: [note.id],
//     );
//   }
//   Future<int> delete(int id) async {
//     final db = await instance.database;
//     return await db.delete(
//       tableNote,
//       where: '${NoteFields.id} = ?',
//       whereArgs: [id],
//     );
//   }
  
//   Future close () async {
//     final db = await instance.database;
//     db.close();
//   }

// }


