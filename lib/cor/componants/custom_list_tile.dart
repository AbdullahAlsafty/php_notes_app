import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.pushReplacementNamed(context, kupdatetesView);
      },
      child: Card(
        child: ListTile(
          leading: Image.asset(Kassets.kLogo),
          title: Text(data[Kresponse.knoteTitle]),
          subtitle: Text(data[Kresponse.knoteSubtitle]),
        ),
      ),
    );
  }
}
