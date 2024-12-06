import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  ///Step 1 make a private Constructor
  DbHelper._();

  ///Step 2 Creating a Static global instance to this class
  static final instance = DbHelper._();

 ///Static DbHelper getInstance() => DbHelper._(); ///You can also use this function

 //// Open Db
  Database ? mDb;

  static final String Table_Note = "note";
  static final String Table_Id = "t_id";
  static final String Table_Column_Title = "t_title";
  static final String Table_Column_Desc = "t_desc";
  static final String Table_Column_CreatedAt = "t_created_at";
  static final String Table_Column_Completed = "t_created_at";


  ////First initial the Database when Database
  Future<Database> initDb()async{
  mDb = mDb ?? await openDb();
  return mDb!;
  }

  Future<Database> openDb()async{
  var dairpath = await getApplicationCacheDirectory();
    var dbpath = join(dairpath.path,"noteDb.db");
    return openDatabase(dbpath,version: 1,onCreate: (db,version){
    print("Db created");
    db.execute("created table $Table_Note ( $Table_Id integer primary key autoincrement, $Table_Column_Title text not null, $Table_Column_Desc text not null, $Table_Column_CreatedAt text, $Table_Column_Completed text)");
    });
  }

  //insert query
  Future<bool> addTask ({required String title,required String desc, required String dueDate}) async{
   Database db = await initDb();
   int rowseffected = await  db.insert(Table_Note,
        {
        Table_Column_Title : title,
        Table_Column_Desc : desc,
          Table_Column_CreatedAt :DateTime.now().microsecondsSinceEpoch.toString(),
          Table_Column_Completed :dueDate,
    }
    );
    print("Rows effected successfully");
      return rowseffected>0;
  }

    ///Selected query
    Future<List<Map<String,dynamic>>> fetchallTask()async{
      Database db = await initDb();
      List<Map<String,dynamic>> alltask = await db.query(Table_Note);
      return alltask;
    }
}