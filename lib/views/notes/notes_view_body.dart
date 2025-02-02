import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_cirecullar_progressindicator.dart';
import 'package:php_notes_app/cor/componants/custom_list_tile.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/model/user_model.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getallnotes(),
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
}

Future<List<dynamic>> getallnotes() async {
  var userInfo = Hive.box(kBoxName).get(khiveUserInfo)!;
  await Future.delayed(Duration(seconds: 1));
  Map<String, dynamic> response = await ApiServer()
      .postRequest(kurlViewNote_PostRequest, {Kresponse.knotuser_id: "${Hive.box(kBoxName).get(khiveUserInfo)['id']}"});
  print('================================1');
  print('================================2');
  print("**************  ${response}");

  print('=================================3');
  List<dynamic> allNotes = [];
  if (response[Kresponse.kstatus] == Kresponse.kstatusFailure) {
    print('///////////////////////1');
    print('///////////////////////2');
    print('///////////////////////3');
  } else if (response[Kresponse.kstatus] == Kresponse.kstatusSucces) {
    print('///////////////////////666');
    print('///////////////////////77777');
    print('///////////////////////88888');
    allNotes = response[Kresponse.kallNotes];
  }

  return allNotes;
}
