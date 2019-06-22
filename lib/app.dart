
import 'package:flutter/material.dart';
import 'package:schedule_app/pages/home_page.dart';
import 'package:schedule_app/pages/schedule_detail_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      routes: {
        '/': (context) => HomePage(),
        '/schedule-detail': (context) => ScheduleDetailPage(),
      },
    );
  }
}
