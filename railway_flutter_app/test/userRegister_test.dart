import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:railwayflutterapp/registerUser.dart';

void main() {
  testWidgets('user register', (WidgetTester tester) async
  {
    registerUser register = new registerUser();
    var app = new MediaQuery(data: new MediaQueryData(), child: new
    MaterialApp(home: register));
    await tester.pumpWidget(app);
  });


}