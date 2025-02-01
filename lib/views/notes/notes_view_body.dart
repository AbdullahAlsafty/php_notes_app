import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/componants/custom_list_tile.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomListTile(title: '', subtitle: '',),
          );
        });
  }
}

 Future< List<Map<String,dynamic>>> allnotes ()async{


List<Map<String ,dynamic>>
}