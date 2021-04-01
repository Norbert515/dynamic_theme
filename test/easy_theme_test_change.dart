import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

ValueKey<String> key = const ValueKey<String>('ok');

GlobalKey<DynamicThemeState> easyThemeKey = GlobalKey<DynamicThemeState>();

void main() {
  testWidgets('change brightness', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    MaterialApp app = find.byType(MaterialApp).evaluate().first.widget as MaterialApp;
    expect(app.theme?.brightness, equals(Brightness.dark));

    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle();

    app = find.byType(MaterialApp).evaluate().first.widget as MaterialApp;
    expect(app.theme?.brightness, equals(Brightness.light));

    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle();

    app = find.byType(MaterialApp).evaluate().first.widget as MaterialApp;
    expect(app.theme?.brightness, equals(Brightness.dark));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        key: easyThemeKey,
        defaultBrightness: Brightness.dark,
        data: (Brightness brightness) {
          return ThemeData(
            primarySwatch: Colors.indigo,
            brightness: brightness,
          );
        },
        themedWidgetBuilder: (BuildContext context, ThemeData theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: ButtonPage(),
          );
        });
  }
}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        DynamicTheme.of(context)?.setBrightness(
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark);
      },
      key: key,
      child: Container(),
    );
  }
}
