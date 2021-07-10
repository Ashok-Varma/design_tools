<p align="center">
  <img src="https://raw.githubusercontent.com/Ashok-Varma/design_tools/main/screenshots/design_tools.svg" width="400" title="Design Tools" alt="Design Tools logo">
</p>

<p align="center">
	<a href="https://pub.dev/packages/design_tools"><img src="https://img.shields.io/pub/v/design_tools.svg" alt="Pub.dev Badge"></a>
	<a href="https://pub.dev/packages/lint"><img src="https://img.shields.io/badge/style-lint-4BC0F5.svg" alt="Lint Badge"></a>
	<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="MIT License Badge"></a>
	<a href="https://github.com/Ashok-Varma/design_tools"><img src="https://img.shields.io/badge/platform-flutter-ff69b4.svg" alt="Flutter Platform Badge"></a>
</p>

# Main Features
- Gridlines
- Keylines

# Quickstart
Add Design Tools to flutter project dependency
```yaml
dependencies:
  design_tools: ^0.2.0
```

## Design Tools for App
Wrap App in DesignTools widget
```dart
import 'package:design_tools/design_tools.dart';

void main() => runApp(
  DesignTools(
    child : MyApp(),
  )
)
```
<p align="start">
  <img src="https://raw.githubusercontent.com/Ashok-Varma/design_tools/main/screenshots/screen2_keyline_Grid.png" width="200" title="App Keylines Guidelines" alt="Image showing App Keylines and GuideLines">
</p>

## Design Tools for widget
Wrap your Widget in DesignTools widget
```dart
import 'package:design_tools/design_tools.dart';

DesignTools(
  child : MyWidget(),
)
```
<p align="start">
  <img src="https://raw.githubusercontent.com/Ashok-Varma/design_tools/main/screenshots/widget_keyline.png" width="200" title="Widget Keylines" alt="Image showing Widget Keylines">
</p>

# Customisations

## [DesignTools](lib/src/design_tools.dart)

| variable           |     Type      | usage                                          |
| ------------------ | :-----------: | ---------------------------------------------- |
| verticalInterval   | GuideInterval | to specify the vertical guides, null to skip   |
| horizontalInterval | GuideInterval | to specify the horizontal guides, null to skip |
| keylines           | Keyline List  | to specify the keylines, empty-array to skip   |

## [GuideInterval](lib/src/design_models.dart#L16)

| variable          |     Type      | usage                                                                         |
| ----------------- | :-----------: | ----------------------------------------------------------------------------- |
| intervals         |      int      | intervals between each guide line                                             |
| divisions         |      int      | divisions between each interval, if two each interval is split to 2 divisions |
| intervalDecorator | LineDecorator | decorator for interval lines                                                  |
| divisionDecorator | LineDecorator | decorator for division lines                                                  |


## [Keyline](lib/src/design_models.dart#L63)

| variable                   |        Type        | usage                                   |
| -------------------------- | :----------------: | --------------------------------------- |
| xPos                       |       double       | position at which ketLine is drawn      |
| gravity                    |   KeylineGravity   | specifies xPos relative to start or end |
| decoration.lineDecorator   |   LineDecorator    | decorator for keyline                   |
| decoration.marginDecorator | BlockLineDecorator | decorator for keyline margin (optional) |

## [LineDecorator](lib/src/design_models.dart#L147)

| variable |  Type  | usage      |
| -------- | :----: | ---------- |
| width    | double | line width |
| color    | color  | line color |

## [BlockLineDecorator](lib/src/design_models.dart#L181)

| variable   |  Type  | usage                                 |
| ---------- | :----: | ------------------------------------- |
| width      | double | line width                            |
| startColor | color  | line gradient along width start color |
| endColor   | color  | line gradient along width end color   |

# Mentions
- [@mitesh77](https://github.com/mitesh77) for wonderful UI templates [Flutter UI Templates](https://github.com/mitesh77/Best-Flutter-UI-Templates)
- [@aloisdeniel](https://github.com/aloisdeniel) for [Flutter Device Preview](https://github.com/aloisdeniel/flutter_device_preview) : motivation for this library