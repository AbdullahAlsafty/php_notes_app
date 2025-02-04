import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/data/model/json_model.dart';

class NotesModel extends JsonModel {
  final String noteId;
  final String notesTitle;
  final String notes_subtitle;
  final String userid;

  const NotesModel(
      {required this.noteId,
      required this.notesTitle,
      required this.notes_subtitle,
      required this.userid});
  factory NotesModel.fromHive(Map<String, dynamic> hiveNotesInfo) {
    Map<String, dynamic> baseHiveMap = hiveNotesInfo;
    return NotesModel(
      noteId: baseHiveMap['id'],
      userid: baseHiveMap['notes_user_id '],
      notesTitle: baseHiveMap['notes_title'],
      notes_subtitle: baseHiveMap['notes_subtitle'],
    );
  }

  factory NotesModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> basejsonMap = jsonData[Kresponse.kuserData];

    return NotesModel(
      noteId: basejsonMap['id'],
      userid: basejsonMap['notes_user_id'],
      notesTitle: basejsonMap['notes_title'],
      notes_subtitle: basejsonMap['notes_subtitle'],
    );
  }
}
