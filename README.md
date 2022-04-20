# bootstrap_like_breakpoints: BSBreakPoints

## Post All Questions on StackOverflow, and tag @CatTrain (user:16200950)
https://stackoverflow.com/
<br />

## Importing:
### YAML:
```yaml
bootstrap_like_breakpoints: ^0.2.0
```

### Dart:
```dart
import 'package:bootstrap_like_breakpoints/bootstrap_like_breakpoints.dart';
```
## A class with static methods and members. Holds the definitions for:
- <code>breakPointLabels</code>
    - The labels for breakpoints:
        - ''
        - sm
        - md
        - lg
        - lx
        - xxl
- <code>breakPoints</code>
    - The widths at which breaks are triggered:
        - '' < 576px
        - sm >= 576px
        - md >= 768px
        - lg >= 992px
        - xl >= 1200px
        - xxl >= 1400px
- <code>containerWidths</code>
    - The width a container is at a particular breakpoint:
        - '': parent width
        - sm: 540px
        - md: 720px
        - lg: 960px
        - xl: 1140px
        - xxl: 1320px
- <code>textTypes</code>
    - The types of text this class has values for
        - h1
        - h2
        - h3
        - h4
        - h5
        - h6
        - p
- <code>textTypesAndSizes</code>
    - A map containing the small and large text sizes for the text that are a <code>_textTypes</code> 
- <code>modalTypes</code>
    - list containing the valid modal types
        - sm
        - md
        - lg
        - xl
- <code>modalTypesAndSizes</code>
    - map containing the types of modal, and their widths
        - sm: 300
        - md: 500
        - lg: 800
        - xl: 1400
<br />

## The class also has static methods:
- <code>double getContainerWidth(String key)</code>
    - Returns a container width based on the breakpoint label passed as a key
- <code>dynamic valueBasedOnBreakPoint({required BuildContext context, required Map<String, dynamic> map,})</code>
    - Returns a value based on the passed map, and current breakpoint
    - The passed context is the current context you call the function from
    - **All breakpoints must be specified:**
        - ''
        - sm
        - md
        - lg
        - xl
        - xxl
    - Example:
    ```dart
    BSContainer(
        children: <Widget>[
            BSRow(
                children: <BSColumn>[
                    BSColumn(
                        children: <Widget>[
                            Builder(
                              builder: (context) {
                                return BSBreakPoints.valueBasedOnBreakPoint(
                                  context: context,
                                  map: const <String, Text>{
                                    "": Text("Smallest"),
                                    "sm": Text("SM"),
                                    "md": Text("MD"),
                                    "lg": Text("LG"),
                                    "xl": Text("XL"),
                                    "xxl": Text("XXL"),
                                  },
                                );
                              },
                            ),
                        ],
                    ),
                ],
            ),
        ],
    ),
    ```
- <code>dynamic valueBasedOnBreakPointFromDefinedWidth({required double width, required Map\<String, dynamic> map,}) </code>
    - same as <code>valueBasedOnBreakPoint</code> but instead of getting the width to determine the breakpoint from the context, the width is passed as a double.
    ```dart
    BSContainer(
        children: <Widget>[
            BSRow(
                children: <BSColumn>[
                    BSColumn(
                        children: <Widget>[
                            Builder(
                              builder: (context) {
                                return BSBreakPoints.valueBasedOnBreakPointFromDefinedWidth(
                                  MediaQuery.of(context).size.width,
                                  map: const <String, Text>{
                                    "": Text("Smallest"),
                                    "sm": Text("SM"),
                                    "md": Text("MD"),
                                    "lg": Text("LG"),
                                    "xl": Text("XL"),
                                    "xxl": Text("XXL"),
                                  },
                                );
                              },
                            ),
                        ],
                    ),
                ],
            ),
        ],
    ),
    ```
- <code>String currentBreakPointLabel(BuildContext context)</code>
    - Returns the current <code>breakPointLabels</code> based on the passed context width
- <code>double columnWidthFromBreakPointTriggers({required double maxWidth, required double screenWidth, required List\<String> breakPointTriggers,})</code>
    - Returns the width a column should be based on the passed screenWidth, the max width, and breakpoint triggers
    - For example, when the breakpoint is md, and a breakpoint trigger of col-md-6 is passed the width would be 50% of the container
```dart
BSBreakPoints.columnWidthFromBreakPointTriggers(
    maxWidth: 1200,
    screenWidth: MediaQuery.of(context).size.width,
    breakPointTriggers: <String>[
        "col-md-6",
    ],
);
```
- <code>static double getTextFontSize(BuildContext context, String textType, {double small = -1, double large = -1,})</code>
    - Returns the size a text type should be based on the screen size. Can have a custom small and or large size passed, otherwise the default large and small sizes are used.
```dart
BSBreakPoints.getTextFontSize(
    context,
    "p",
    small: 14,
    large: 25,
),
```
- <code>static double getDynamicModalWidth(BuildContext context)</code>
    - returns a width based on the current context's width
        - "", sm = 300
        - md = 500
        - lg, xl = 800
        - xxl = 1140
```dart
BSBreakPoints.getDynamicModalWidth(context);
```
- <code>static double getModalWidthBasedOnType(String type)</code>
    - returns the width a modal should be based on the passed type
        - sm = 300
        - md = 500
        - lg = 800
        - xl = 1140
```dart
BSBreakPoints.getModalWidthBasedOnType("md");
```

#  Deprecated
### Methods:
- <code>Map<String, double> getBreakPoints() </code>
    - Returns the <code>breakPoints</code>
- <code>static Map<String, double> getContainerWidths()</code>
    - Returns <code>containerWidths</code>
- <code>List\<String> getBreakPointLabels()</code>
    - Returns <code>breakPointLabels</code>