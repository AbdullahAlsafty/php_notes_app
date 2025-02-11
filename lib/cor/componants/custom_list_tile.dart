import 'dart:developer';

import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

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
        print('4444');
        Navigator.pushNamed(context, kupdatetesView, arguments: widget.data);
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 50,
            child: ClipOval(
              child: Image.network(
                "$kurlImageRout${widget.data["notes_image"]}",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: ListTile(
                title: Text(widget.data[Kresponse.knoteTitle]),
                subtitle: Text(widget.data[Kresponse.knoteSubtitle]),
                trailing: IconButton(
                    onPressed: () async {
                      await deletNote();
                    },
                    icon: Icon(Icons.delete)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deletNote() async {
    String deletLink = kurldeleteNote_PostRequest;

    Either<String, Map<String, dynamic>> response =
        await ApiServer().postRequest(deletLink, {
      "note_id": "${widget.data['id']}",
      "imagename": widget.data["notes_image"],
    });

    response.fold((left) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(left),
                title: Text('error '),
              ));
    }, (right) {
      if (right['Status'] == 'Success delet note') {
        Navigator.pushReplacementNamed(context, kNotesview);
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(right['Status']),
                  title: Text('error  '),
                ));
      }
    });
  }
}
