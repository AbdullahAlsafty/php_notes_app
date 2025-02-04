import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';

class NotesModel {
  final String noteId;
  final String notesTitle;
  final String notes_subtitle;
  final String userid;

  const NotesModel(
      {required this.noteId,
      required this.notesTitle,
      required this.notes_subtitle,
      required this.userid});
  factory NotesModel.fromHive(Map<String,dynamic> hiveNotesInfo) {
    Map<String, dynamic> baseHiveMap = hiveNotesInfo;
    return NotesModel(
        noteId: baseHiveMap['id'],
        userid: baseHiveMap[Kresponse.kuserid],
        notesTitle: baseHiveMap[Kresponse.knoteTitle],
        notes_subtitle: baseHiveMap[Kresponse.knoteSubtitle],
        );
  }

  factory NotesModel.fromJson(var jsonData) {
        Map<String, dynamic> basejsonMap = jsonData[Kresponse.kuserData];

    return NotesModel(


      noteId: basejsonMap['id'],
        userid: basejsonMap[Kresponse.kuserid],
        notesTitle: basejsonMap[Kresponse.knoteTitle],
        notes_subtitle: basejsonMap[Kresponse.knoteSubtitle], 

    );
  }
}
