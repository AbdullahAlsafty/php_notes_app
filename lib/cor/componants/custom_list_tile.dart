import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, kupdatetesView,
            arguments: widget.data);
      },
      child: Card(
        child: ListTile(
          leading: Image.asset(Kassets.kLogo),
          title: Text(widget.data[Kresponse.knoteTitle]),
          subtitle: Text(widget.data[Kresponse.knoteSubtitle]),
          trailing: IconButton(
              onPressed: () async {
                await deletNote();
              },
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }

  Future<void> deletNote() async {
    Either<String, Map<String, dynamic>> response = await ApiServer()
        .postRequest(
            kurldeleteNote_PostRequest, {"note_id": "${widget.data['id']}"});

    response.fold((left) {
      CustomSnackBar.faillureSnackBar(context, left);
    }, (right) {
      if (right[Kresponse.kstatus] == Kresponse.kstatusSucces) {
        Navigator.pushReplacementNamed(context, kNotesview);
      } else {
        CustomSnackBar.faillureSnackBar(context, 'لم يتم الحذف بنجاح');
      }
    });
  }
}
