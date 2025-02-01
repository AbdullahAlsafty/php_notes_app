import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/cor/functions/edit_hive.dart';

class GetSignOutButton extends StatelessWidget {
  const GetSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
              onTap: () {
              EditHive.clearUserinfo();
                   Navigator.of(context).pushNamed(kHomeView);

              },
              child: Text(
                'Sign Out >>',
                style: Kstyles.kTextStyle(
                    22, const Color.fromARGB(255, 136, 182, 220)),
              ),
            );
  }
}