import 'package:flutter/material.dart';

import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/views/home_view/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home page ',
          style: Kstyles.kTextStyle(30),
        ),
      ),
      body: HomeViewBody(),
    );
  }
}
