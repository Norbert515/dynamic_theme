# dynamic_theme

## Dynamically changing your theme without hassle

![](https://github.com/Norbert515/dynamic_theme/blob/master/assets/theme.png)

This packages manages changing your theme during runtime and persiting that theme.

## Include in your project

```
dependencies:
  dynamic_theme: ^2.0.0
```

run packages get and import it

```
import 'package:dynamic_theme/dynamic_theme.dart';
```

## Usage

### Light & Dark mode

If all you want is to change the theme between light and dark you can just use the `themeMode` parameter and set the light theme with the `theme` property and dark theme with the `darkTheme` property.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      themedWidgetBuilder: (_, themeMode, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}
```

### Custom theme

If you want to apply some custom `ThemeData` you can use the `data` parameter to provide a custom `ThemeData` and rely on the `themeData` from the `themedWidgetBuilder` .

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (themeMode) => ThemeData(
        primarySwatch: Colors.indigo,
        brightness: themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
      ),
      themedWidgetBuilder: (_, __, themeData) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeData,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}
```

Change the theme like this:

```dart
void changeThemeMode() {
  DynamicTheme.of(context).setThemeMode(Theme.of(context).brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark);
}
  
void changeColor() {
  DynamicTheme.of(context).setThemeData(ThemeData(
    primaryColor: Theme.of(context).primaryColor == Colors.indigo ? Colors.red : Colors.indigo
  ));
}
```

When changing the theme mode with `setThemeMode` , it is additionally stored in the shared preferences.

## Also included

### A dialog widget to change the theme mode !

![](https://github.com/Norbert515/dynamic_theme/blob/master/assets/dialogs.png)

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
