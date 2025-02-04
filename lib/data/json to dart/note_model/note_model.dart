import 'all_note.dart';

class NoteModel {
  String? status;
  int? rowCoun;
  List<AllNote>? allNotes;

  NoteModel({this.status, this.rowCoun, this.allNotes});

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        status: json['Status'] as String?,
        rowCoun: json['Row Coun'] as int?,
        allNotes: (json['allNotes'] as List<dynamic>?)
            ?.map((e) => AllNote.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Row Coun': rowCoun,
        'allNotes': allNotes?.map((e) => e.toJson()).toList(),
      };
}
