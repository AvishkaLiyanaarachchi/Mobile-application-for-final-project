import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:railwayflutterapp/home.dart';


void main() {
  testWidgets('home page', (WidgetTester tester) async
  {
    Home home = new Home();
    var app = new MediaQuery(data: new MediaQueryData(), child: new
     MaterialApp(home: home));
    await tester.pumpWidget(app);
  });

}