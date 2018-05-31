
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Brightness brightness;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  brightness = (prefs.getBool("isDark") ?? false) ? Brightness.dark: Brightness.light;
  runApp(new MyApp(brightness: brightness,));
}


class MyApp extends StatefulWidget {

  final Brightness brightness;

  const MyApp({Key key, this.brightness}) : super(key: key);

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {



  Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: new MyHomePage(
        title: 'Flutter Demo Home Page',
        onThemeChanged: (data) {
          setState(() {
            brightness = data.brightness;
          });
        },
      ),
    );
  }


}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.onThemeChanged}) : super(key: key);

  final String title;

  final ValueChanged<ThemeData> onThemeChanged;


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Easy Theme"),
      ),
      body: new Center(
        child: new RaisedButton(onPressed: () {
          changeBrightness(context);
        }, child: new Text("Change bightness"),),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.add),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.insert_drive_file),
              title: new Text("Tab 1")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.show_chart),
              title: new Text("Tab 2")
          ),
        ],
      ),
    );
  }

  void changeBrightness(BuildContext context) {
    widget.onThemeChanged(Theme.of(context).copyWith(
      brightness: Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark,
    ));
  }
}
