class AllNote {
  int? id;
  String? notesTitle;
  String? notesSubtitle;
  String? notesImage;
  int? notesUserId;

  AllNote({
    this.id,
    this.notesTitle,
    this.notesSubtitle,
    this.notesImage,
    this.notesUserId,
  });

  factory AllNote.fromJson(Map<String, dynamic> json) => AllNote(
        id: json['id'] as int?,
        notesTitle: json['notes_title'] as String?,
        notesSubtitle: json['notes_subtitle'] as String?,
        notesImage: json['notes_image'] as String?,
        notesUserId: json['notes_user_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'notes_title': notesTitle,
        'notes_subtitle': notesSubtitle,
        'notes_image': notesImage,
        'notes_user_id': notesUserId,
      };
}
