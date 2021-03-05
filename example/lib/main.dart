import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (Brightness brightness) => ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: DynamicTheme.of(context).toggleBrightness,
              child: const Text('Toggle brightness'),
            ),
            ElevatedButton(
              onPressed: changeColor,
              child: const Text('Change color'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showChooser,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Tab 2',
          ),
        ],
      ),
    );
  }

  void showChooser() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BrightnessSwitcherDialog(
          onSelectedTheme: (Brightness brightness) {
            DynamicTheme.of(context).setBrightness(brightness);
          },
        );
      },
    );
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(
      ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo
            ? Colors.red
            : Colors.indigo,
      ),
    );
  }
}
