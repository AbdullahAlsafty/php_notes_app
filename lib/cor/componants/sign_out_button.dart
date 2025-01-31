import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/constants/kBox_hive.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

class GetSignOutButton extends StatelessWidget {
  const GetSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
              onTap: () {
                print ('====== Hive values befor sign out >> ${Hive.box(kBoxName).values}');
                Hive.box(kBoxName).clear();
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