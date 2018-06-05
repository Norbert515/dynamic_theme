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

  ThemeData _data;

  Brightness _brightness;

  static const String _sharedPreferencesKey = "isDark";

  bool loaded = false;

  @override
  void initState() {
    super.initState();
    _brightness = widget.defaultBrightness;
    _data = widget.data(_brightness);

    loadBrightness().then((dark) {
      setState(() {
        _brightness = dark? Brightness.dark: Brightness.light;
        _data = widget.data(_brightness);
        loaded = true;
      });
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = widget.data(_brightness);
  }


  @override
  void didUpdateWidget(EasyTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _data = widget.data(_brightness);
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(context, _data);
  }

  void setBrightness(Brightness brightness) async{
    setState(() {
      this._data = widget.data(brightness);
      this._brightness = brightness;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_sharedPreferencesKey, brightness == Brightness.dark? true: false);
  }


  void setThemeData(ThemeData data) {
    setState(() {
      this._data = data;
    });
  }


  Future<bool> loadBrightness() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getBool(_sharedPreferencesKey) ?? false);
  }


}


