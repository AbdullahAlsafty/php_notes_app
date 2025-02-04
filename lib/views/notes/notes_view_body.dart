import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_cirecullar_progressindicator.dart';
import 'package:php_notes_app/cor/componants/custom_list_tile.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getallnotes(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isEmpty
                ? Center(
                    child: Text(
                    'empty Notes',
                    style: Kstyles.kTextStyle(50),
                  ))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return CustomListTile(data: snapshot.data![index]);
                        }),
                  );
          } else {
            return Circularprog();
          }
        });
  }







  Future<List<dynamic>> getallnotes(BuildContext context ) async {
  List<dynamic> allNotes = [];
  Either<String, Map<String, dynamic>> response = await ApiServer().postRequest(
      kurlViewNote_PostRequest,
      {Kresponse.kuserid: "${Hive.box(kBoxName).get(khiveUserInfo)['id']}"});

  response.fold((left) {
    CustomSnackBar.faillureSnackBar(context, left);
  }, (right) {
    if (right[Kresponse.kstatus] == Kresponse.kstatusSucces) {

          allNotes = right[Kresponse.kallNotes];

    } else {
     WidgetsBinding.instance.addPostFrameCallback((_){
 CustomSnackBar.faillureSnackBar(context, "لا يوجد اي ملاحظات  ");
     });
    }
  });



   return allNotes;
}
}


