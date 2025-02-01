import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title, required this.subtitle});
final String title,subtitle ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: Image.asset(Kassets.kLogo),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
