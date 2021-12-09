import 'package:flutter/material.dart';

extension on Brightness {
  ThemeMode toThemeMode() {
    return this == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }
}

class BrightnessSwitcherDialog extends StatelessWidget {
  const BrightnessSwitcherDialog({Key? key, required this.onSelectedTheme})
      : super(key: key);

  final ValueChanged<ThemeMode> onSelectedTheme;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Theme'),
      children: <Widget>[
        RadioListTile<ThemeMode>(
          value: ThemeMode.light,
          groupValue: Theme.of(context).brightness.toThemeMode(),
          onChanged: (ThemeMode? value) {
            onSelectedTheme(ThemeMode.light);
          },
          title: const Text('Light'),
        ),
        RadioListTile<ThemeMode>(
          value: ThemeMode.dark,
          groupValue: Theme.of(context).brightness.toThemeMode(),
          onChanged: (ThemeMode? value) {
            onSelectedTheme(ThemeMode.dark);
          },
          title: const Text('Spooky  👻'),
        ),
      ],
    );
  }
}
