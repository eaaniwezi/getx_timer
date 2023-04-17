
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_timer/view/horizontal_timeline_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Timeline Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   HorizontalTimelineView(),
    );
  }
}
