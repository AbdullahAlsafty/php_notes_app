import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';

class NotesModel {
  final String noteId;
  final String notesTitle;
  final String notes_subtitle;
  final String note_user_id;

  const NotesModel(
      {required this.noteId,
      required this.notesTitle,
      required this.notes_subtitle,
      required this.note_user_id});
  factory NotesModel.fromHive(Map<String,dynamic> hiveNotesInfo) {
    Map<String, dynamic> baseHiveMap = hiveNotesInfo;
    return NotesModel(
        noteId: baseHiveMap['id'],
        note_user_id: baseHiveMap[Kresponse.knotuser_id],
        notesTitle: baseHiveMap[Kresponse.knoteTitle],
        notes_subtitle: baseHiveMap[Kresponse.knoteSubtitle],
        );
  }

  factory NotesModel.fromJson(var jsonData) {
        Map<String, dynamic> basejsonMap = jsonData[Kresponse.kuserData];

    return NotesModel(


      noteId: basejsonMap['id'],
        note_user_id: basejsonMap[Kresponse.knotuser_id],
        notesTitle: basejsonMap[Kresponse.knoteTitle],
        notes_subtitle: basejsonMap[Kresponse.knoteSubtitle], 

    );
  }
}
