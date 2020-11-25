import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:railwayflutterapp/time_table_navbar.dart';

void main() {
  testWidgets('home page', (WidgetTester tester) async
  {
    TimeTableNavbar timeTableNavbar = new TimeTableNavbar();
    var app = new MediaQuery(data: new MediaQueryData(), child: new
    MaterialApp(home: timeTableNavbar));
    await tester.pumpWidget(app);
  });

}