import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


typedef Widget ThemedWidgetBuilder(BuildContext context, ThemeData data);

typedef ThemeData ThemeDataWithBrightnessBuilder(Brightness brightness);

class EasyTheme extends StatefulWidget {

  final ThemedWidgetBuilder themedWidgetBuilder;

  final ThemeDataWithBrightnessBuilder data;

  final Brightness defaultBrightness;

  const EasyTheme({Key key, this.data, this.themedWidgetBuilder, this.defaultBrightness}) : super(key: key);

  @override
  EasyThemeState createState() => new EasyThemeState();

  static EasyThemeState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<EasyThemeState>());
  }
}

class EasyThemeState extends State<EasyTheme> {

  ThemeData data;

  Brightness brightness;

  static const String _sharedPreferencesKey = "isDark";

  bool loaded = false;

  @override
  void initState() {
    super.initState();
    brightness = widget.defaultBrightness;
    data = widget.data(brightness);

    loadBrightness().then((dark) {
      setState(() {
        brightness = dark? Brightness.dark: Brightness.light;
        data = widget.data(brightness);
        loaded = true;
      });
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = widget.data(brightness);
  }


  @override
  void didUpdateWidget(EasyTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = widget.data(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return !loaded? new SizedBox(): widget.themedWidgetBuilder(context, data);
  }

  void setBrightness(Brightness brightness) async{
    setState(() {
      this.data = widget.data(brightness);
      this.brightness = brightness;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_sharedPreferencesKey, brightness == Brightness.dark? true: false);
  }


  void setThemeData(ThemeData data) {
    setState(() {
      this.data = data;
    });
  }


  Future<bool> loadBrightness() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getBool(_sharedPreferencesKey) ?? false);
  }


}


