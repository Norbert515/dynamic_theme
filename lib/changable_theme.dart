import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


class EasyTheme extends StatefulWidget {

  final Widget child;

  final ThemeData data;

  const EasyTheme({Key key, this.data, this.child}) : super(key: key);

  @override
  EasyThemeState createState() => new EasyThemeState();

  static EasyThemeState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<EasyThemeState>());
  }
}

class EasyThemeState extends State<EasyTheme> {

  ThemeData data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = widget.data;
  }


  @override
  void didUpdateWidget(EasyTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedTheme(data: data, child: widget.child);
  }

  void setBrightness(Brightness brightness) {
    print("Changed theme");
    setState(() {
      data = data.copyWith(brightness: brightness);
    });
  }

}
