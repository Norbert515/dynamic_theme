import 'package:flutter/material.dart';

class BrightnessSwitcherDialog extends StatelessWidget {
  final ValueChanged<Brightness> onSelectedTheme;

  const BrightnessSwitcherDialog({Key key, this.onSelectedTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: const Text('Select Theme'),
      children: <Widget>[
        new RadioListTile<Brightness>(
          value: Brightness.light,
          groupValue: Theme.of(context).brightness,
          onChanged: (value) {
            onSelectedTheme(Brightness.light);
          },
          title: new Text("Light"),
        ),
        new RadioListTile<Brightness>(
          value: Brightness.dark,
          groupValue: Theme.of(context).brightness,
          onChanged: (value) {
            onSelectedTheme(Brightness.dark);
          },
          title: new Text("Spooky  👻"),
        ),
      ],
    );
  }
}
