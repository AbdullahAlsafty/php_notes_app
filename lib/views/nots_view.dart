import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/views/widgets/nots_view_body.dart';

class NotsView extends StatelessWidget {
  const NotsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Nots',
            style: Kstyles.kTextStyle(18),
          ),
        ),
        body: NotsViewBody());
  }
}
