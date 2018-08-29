import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


var key = new ValueKey("ok");
DynamicThemeState state;

var easyThemeKey = new GlobalKey<DynamicThemeState>();
void main() {
  testWidgets('test finds state', (WidgetTester tester) async {


    await tester.pumpWidget(new MyApp());

    expect(state, equals(null));

    await tester.tap(find.byKey(key));
    await tester.pump();

    expect(state, isNotNull);

  });


}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
         key: easyThemeKey,
        defaultBrightness: Brightness.light,
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
      state = DynamicTheme.of(context);
    },key: key,);
  }
}
