import 'package:new_note_app/note_model.dart';
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
  static final String Table_Column_Completed = "t_completed_at";


  ////First initial the Database when Database
  Future<Database> initDb()async{
  mDb = mDb ?? await openDb();
  return mDb!;
  }

  Future<Database> openDb()async{
  var dairpath = await getApplicationCacheDirectory();
    var dbpath = join(dairpath.path,"noteDb.db");
  // await deleteDatabase(dbpath); // Add this line in openDb() before openDatabase(...)
  return openDatabase(dbpath,version: 1,onCreate: (db,version){
    print("Db created");
    db.execute("CREATE TABLE $Table_Note ( $Table_Id INTEGER PRIMARY KEY AUTOINCREMENT, $Table_Column_Title TEXT NOT NULL, $Table_Column_Desc TEXT NOT NULL, $Table_Column_CreatedAt TEXT, $Table_Column_Completed TEXT)");
    });
  }

  //insert query
  Future<bool> addTask (NoteModel newNote) async{
   Database db = await initDb();

   ///before NoteModel
   /*int rowseffected = await  db.insert(Table_Note,
        {
        Table_Column_Title : title,
        Table_Column_Desc : desc,
        *//*  Table_Column_CreatedAt :DateTime.now().microsecondsSinceEpoch.toString(),
          Table_Column_Completed :dueDate,*//*
    }
    );*/
   int rowseffected = await db.insert(Table_Note, newNote.toMap());
    print("Rows effected successfully");
      return rowseffected>0;
  }

    ///Selected query
    Future<List<NoteModel>> fetchallTask()async{
      Database db = await initDb();
      List<NoteModel> mNotes = [];
      List<Map<String,dynamic>> alltask = await db.query(Table_Note);

      for(Map<String,dynamic> eachnotes in alltask){
        NoteModel eachNote = NoteModel.fromMap(eachnotes);
        mNotes.add(eachNote);
      }

      return mNotes;
    }

    Future<bool> updateNotes({required String title, required String desc, required int id})async{
    Database db = await initDb();
   int rowseffected = await db.update(Table_Note, {
      Table_Column_Title : title,
      Table_Column_Desc : desc,
    }, where: "$Table_Id = ?",whereArgs: [id]);
    return rowseffected>0;

}
  Future<bool> deleteNote({required int id})async{
    Database db = await initDb();
    int rowseffected = await db.delete(Table_Note, where: "$Table_Id = ?",whereArgs: [id]);
    return rowseffected>0;
  }

}