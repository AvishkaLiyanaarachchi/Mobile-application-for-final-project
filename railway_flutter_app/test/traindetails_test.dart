import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:railwayflutterapp/placeholder_widget.dart';

void main() {
  testWidgets('home page', (WidgetTester tester) async
  {
    PlaceHolderWidget placeHolderWidget = new PlaceHolderWidget();
    var app = new MediaQuery(data: new MediaQueryData(), child: new
     MaterialApp(home: placeHolderWidget));
    await tester.pumpWidget(app);
  });

}