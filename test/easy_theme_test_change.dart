import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


var key = new ValueKey("ok");

var easyThemeKey = new GlobalKey<DynamicThemeState>();

void main() {
  testWidgets('change brightness', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    MaterialApp app = find.byType(MaterialApp).evaluate().first.widget;
    expect(app.theme.brightness, equals(Brightness.dark));


    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle();

    app = find.byType(MaterialApp).evaluate().first.widget;
    expect(app.theme.brightness, equals(Brightness.light));

    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle();

    app = find.byType(MaterialApp).evaluate().first.widget;
    expect(app.theme.brightness, equals(Brightness.dark));

  });


}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
         key: easyThemeKey,
        defaultBrightness: Brightness.dark,
        data: (brightness) {
           return new ThemeData(
          primarySwatch: Colors.indigo,
          brightness: brightness,
        );},
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: new ButtonPage(),
          );
        }
    );
  }
}


class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: (){
      DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
    },key: key,);
  }
}
