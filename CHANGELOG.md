# CHANGE LOG

## 2.0.0

**BREAKING CHANGES**

* Migration to null-safety ([#62](https://github.com/Norbert515/dynamic_theme/issues/62), [#60](https://github.com/Norbert515/dynamic_theme/issues/60), [#59](https://github.com/Norbert515/dynamic_theme/issues/59))
* Now use the `ThemeMode` instead of `Brightness` ([#49](https://github.com/Norbert515/dynamic_theme/issues/49)).
* `ThemedWidgetBuilder themedWidgetBuilder` takes now the following parameters: `BuildContext, ThemeMode, ThemeData`.
* `data` parameter is now optional and has the type `ThemeDataWithThemeModeBuilder`.
* `defaultBrightness` became `defaultThemeMode` and use by default `ThemeMode.system`.
* `loadBrightnessOnStart` became `loadThemeOnStart`.
* import `package:dynamic_theme/dynamic_theme.dart` for both `DynamicTheme` and `BrightnessSwitcherDialog`.

## 1.0.1

* Update local_storage dependency to latest 0.5.0
* Added and fixed linter rules
* Fixed default Dark mode problem from PRs
