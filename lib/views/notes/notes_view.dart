import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/sign_out_button.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/data/model/notes_model.dart';
import 'package:php_notes_app/data/model/user_model.dart';
import 'package:php_notes_app/views/notes/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, kaddNotesView);
          }),
      appBar: AppBar(
      
        actions: [GetSignOutButton()],
        title: Text(
          'Notes',
          style: Kstyles.kTextStyle(22),
        ),
      ),
      body: NotesViewBody(),
    );
  }
}
