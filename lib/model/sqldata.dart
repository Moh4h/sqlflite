import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldata  extends GetxController{
  static Database? _db;

  // دالة لترجيع قاعدة البيانات و التأكد ان كان قد تم انشاءها او لا

  Future<Database?> get db async {
    if (_db == null) {
      _db = await dataBaseIntail();
      return _db;
    } else
      return _db;
  }

  dataBaseIntail() async {
    //موقع افتراضي للداتابيز

    String path = await getDatabasesPath();

    // ربط المسار الافتراضي مع اسم الداتابيز يلي منديرها

    String dataBasefullpathName = join(path, "myBase.db");

    Database myDB = await openDatabase(
      dataBasefullpathName,
      onCreate: _onCreate,
      version: 2,
      onUpgrade: _onUpgrade,
    );
    return myDB;
  }
// يتم استدعاءها فكل مره يتم تغييير الاصدار
  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("on update ==================");
  }

  // هذه الدالة لكي يتم انشاء الجداول ويتم اتسدعال هذه الدالة فقط ف التهيئة الأولية

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "notes" (
"id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
"title" TEXT NOT NULL,
"note" TEXT NOT NULL
)
''');
    print("created data base :3=====================");
  }

  // دالة لجلب البيانات
  selectData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  // دالة لاضافة بيانات البيانات
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    update();
    return response;
  }

  // دالة لتحديث البيانات
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    update();
    return response;
  }

  // دالة حذف البيانات البيانات
  daleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    update();
    return response;
  }
   Future<List<Map>> readDate() async {
    List<Map> response = await selectData("select * from 'notes'");
    return response;
  }
}
