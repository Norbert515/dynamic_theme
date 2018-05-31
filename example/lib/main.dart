import 'package:flutter/material.dart';
import 'package:easy_theme/changable_theme.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new EasyTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          home: new MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

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
        child: new RaisedButton(onPressed: (){
          changeBrightness(context);
        }, child: new Text("Change bightness"),),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){},
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
    EasyTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }
}



