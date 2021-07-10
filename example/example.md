

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

## Design Tools for widget
Wrap your Widget in DesignTools widget
```dart
import 'package:design_tools/design_tools.dart';

DesignTools(
  child : MyWidget(),
)
```

## Customisations
```dart
DesignTools(
          verticalInterval: GuideInterval(18, divisions: 2, decoration: GridIntervalDecoration(intervalWidth: 0.25)),
          horizontalInterval: GuideInterval(18, divisions: 2),
          keylines: [
            Keyline(18),
            Keyline(18, gravity: KeylineGravity.end),
          ],
          child: MyWidget(),
)
```