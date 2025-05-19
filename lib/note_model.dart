import 'dbhelper.dart';

class NoteModel {
  int? id;
  String title;
  String desc;
 /* String? createdAt;
  String? completedAt;*/

  NoteModel(
      {this.id,
      required this.title,
      required this.desc,
     /* required this.createdAt,
      required this.completedAt*/
      });

  Map<String, dynamic> toMap() {
    return {
      DbHelper.Table_Column_Title : title,
      DbHelper.Table_Column_Desc : desc,
     /* DbHelper.Table_Column_CreatedAt : createdAt,
      DbHelper.Table_Column_Completed : completedAt,*/
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        id: map[DbHelper.Table_Id],
        title: map[DbHelper.Table_Column_Title],
        desc: map[DbHelper.Table_Column_Desc],
      /*  createdAt: map[DbHelper.Table_Column_CreatedAt],
        completedAt: map[DbHelper.Table_Column_Completed]*/
    );
  }
}
