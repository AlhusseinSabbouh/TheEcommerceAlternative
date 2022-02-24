import 'package:ecmmerce_app/model/course.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database?> createDatabase() async {
    if (_db != null) return _db;

    String path = join(await getDatabasesPath(), 'Courses.db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int v) async {
      await db.execute("""create table Courses (
        id integer primary key autoincrement,
        name text,
        desc text , 
        hours integer)""");
    });
    return _db;
  }

  Future<void> addCourses(CourseModel courseModel) async {
    Database? db = await createDatabase();

    await db?.insert("Courses", courseModel.toJson());

    print(db);
  }

  Future<List<Map<String, Object?>>?> getAllCourse() async {
    Database? db = await createDatabase();
    return await db?.query("Courses");
  }

  Future<void> deletedCourse(int id) async {
    Database? db = await createDatabase();
    db?.delete("Courses", where: "id   = ?", whereArgs: [id]);
  }

  Future<void> updatedCourse(CourseModel courseModel) async {
    Database? db = await createDatabase();
    db?.update("Courses", courseModel.toJson(),
        where: "id = ?", whereArgs: [courseModel.id]);
  }

//   Future<void> _onCreate(Database db, int v) async {
//     await db.execute("""create table Courses (
//         id integer primary key autoincrement,
//         name text,
//         desc text ,
//         hours integer
//       )
// """);
//   }
}
