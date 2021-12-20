import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

ValueKey<String> key = const ValueKey<String>('ok');

GlobalKey<DynamicThemeState> easyThemeKey = GlobalKey<DynamicThemeState>();

void main() {
  testWidgets('change brightness', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    MaterialApp app =
        find.byType(MaterialApp).evaluate().first.widget as MaterialApp;
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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      key: easyThemeKey,
      defaultThemeMode: ThemeMode.dark,
      data: (ThemeMode mode) {
        return ThemeData(
          primarySwatch: Colors.indigo,
          brightness:
              mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
        );
      },
      themedWidgetBuilder: (
        BuildContext context,
        ThemeMode mode,
        ThemeData? theme,
      ) {
        return MaterialApp(
          themeMode: mode,
          title: 'Flutter Demo',
          theme: theme,
          home: const ButtonPage(),
        );
      },
    );
  }
}

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        DynamicTheme.of(context).setThemeMode(
          Theme.of(context).brightness == Brightness.dark
              ? ThemeMode.light
              : ThemeMode.dark,
        );
      },
      key: key,
      child: Container(),
    );
  }
}
