import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/views/notes/add_notview_body.dart';
import 'package:php_notes_app/views/notes/update_noteview_body.dart';

class UpdateNoteView extends StatelessWidget {
  const UpdateNoteView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        
          title: Text(
            'update Not',
            style: Kstyles.kTextStyle(18),
          ),
        ),
        body: UpdateNoteviewBody());
  }
}
