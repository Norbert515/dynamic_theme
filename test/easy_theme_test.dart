import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

ValueKey<String> key = const ValueKey<String>('ok');
DynamicThemeState? state;
GlobalKey<DynamicThemeState> easyThemeKey = GlobalKey<DynamicThemeState>();

void main() {
  testWidgets('test finds state', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(state, equals(null));

    await tester.tap(find.byKey(key));
    await tester.pump();

    expect(state, isNotNull);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      key: easyThemeKey,
      defaultThemeMode: ThemeMode.light,
      themedWidgetBuilder: (
        BuildContext context,
        ThemeMode mode,
        ThemeData? theme,
      ) {
        return MaterialApp(
          themeMode: mode,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.indigo,
            brightness: Brightness.dark,
          ),
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
        state = DynamicTheme.of(context);
      },
      key: key,
      child: Container(),
    );
  }
}
