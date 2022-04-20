library bootstrap_like_breakpoints;

/*
  Bradley Honeyman
  Oct 27, 2021

  Ref:
  https://getbootstrap.com/docs/5.0/layout/containers/

 */

import 'package:flutter/material.dart';

/// A class for managing break points, their labels and values
/// values are based on the current screen width
class BSBreakPoints {
  /// a list containing the breakpoint labels from smallest to largest
  /// "" -> xxl
  static final List<String> breakPointLabels = <String>[
    "",
    "sm",
    "md",
    "lg",
    "xl",
    "xxl",
  ];

  /// Map containing breakpoint labels as keys, and the
  /// corresponding breakpoint widths
  /// "": 576
  /// sm: 576
  /// md: 768
  /// lg: 992
  /// xl: 1200
  /// xxl: 1400
  static final Map<String, double> breakPoints = {
    breakPointLabels[0]: 576, //<
    breakPointLabels[1]: 576, //>=
    breakPointLabels[2]: 768, //>=
    breakPointLabels[3]: 992, //>=
    breakPointLabels[4]: 1200, //>=
    breakPointLabels[5]: 1400, //>=
  };

  /// Map containing breakpoint labels, and the corresponding
  /// container widths, note that "" breakpoint is -1.
  /// this is because is must be set to screen width
  /// "": screen width
  /// sm: 540
  /// md: 720
  /// lg: 960
  /// xl: 1140
  /// xxl: 1320
  static final Map<String, double> containerWidths = {
    breakPointLabels[0]: -1, // set to full width
    breakPointLabels[1]: 540,
    breakPointLabels[2]: 720,
    breakPointLabels[3]: 960,
    breakPointLabels[4]: 1140,
    breakPointLabels[5]: 1320,
  };

  /// List containing types of text
  /// p
  /// h1
  /// h2
  /// h3
  /// h4
  /// h5
  /// h6
  static final List<String> textTypes = [
    "p",
    "h1",
    "h2",
    "h3",
    "h4",
    "h5",
    "h6",
  ];

  /// A map containing the small and large text sizes for the text that
  /// are a _textTypes
  /// p
  /// h1
  /// h2
  /// h3
  /// h4
  /// h5
  /// h6
  static final Map<String, Map<String, double>> textTypesAndSizes = {
    textTypes[0]: <String, double>{
      "sm": 16,
      "lg": 16,
    },
    textTypes[1]: <String, double>{
      "sm": 32,
      "lg": 40,
    },
    textTypes[2]: <String, double>{
      "sm": 25,
      "lg": 32,
    },
    textTypes[3]: <String, double>{
      "sm": 22,
      "lg": 28,
    },
    textTypes[4]: <String, double>{
      "sm": 24,
      "lg": 24,
    },
    textTypes[5]: <String, double>{
      "sm": 16,
      "lg": 20,
    },
    textTypes[6]: <String, double>{
      "sm": 13,
      "lg": 16,
    },
  };

  /// list containing the valid modal types
  /// sm
  /// md
  /// lg
  /// xl
  static final List<String> modalTypes = <String>[
    "sm",
    "md",
    "lg",
    "xl",
  ];

  /// map containing the types of modal, and their widths
  /// sm: 300
  /// md: 500
  /// lg: 800
  /// xl: 1400
  static final Map<String, double> modalTypesAndSizes = <String, double>{
    modalTypes[0]: 300,
    modalTypes[1]: 500,
    modalTypes[2]: 800,
    modalTypes[3]: 1140,
  };

  /// returns map with breakpoints
  ///     "": 576, //<
  ///     "sm": 576, //>=
  ///     "md": 768, //>=
  ///     "lg": 992, //>=
  ///     "xl": 1140, //>=
  ///     "xxl": 1400, //>=
  @deprecated
  static Map<String, double> getBreakPoints() {
    return breakPoints;
  }

  /// returns a container width based on the passed breakpoint
  /// "": -1, because must be generated
  /// sm: 540,
  /// md: 720,
  /// lg: 960,
  /// xl: 1140,
  /// xxl: 1320,
  static double getContainerWidth(String key) {
    if (!breakPointLabels.contains(key)) {
      throw FormatException(
          "BSBreakpoint:\nPassed key '$key' is invalid, must be:\n${breakPointLabels.toString()}");
    }
    return containerWidths[key]!;
  }

  /// returns all container widths, based on breakpoint
  /// "": -1, because must be generated
  /// sm: 540,
  /// md: 720,
  /// lg: 960,
  /// xl: 1140,
  /// xxl: 1320,
  @deprecated
  static Map<String, double> getContainerWidths() {
    return containerWidths;
  }

  /// returns array of break point labels
  /// ""
  /// "sm"
  /// "md"
  /// "lg"
  /// "xl"
  /// "xxl"
  @deprecated
  static List<String> getBreakPointLabels() {
    return breakPointLabels;
  }

  static dynamic valueBasedOnBreakPointFromDefinedWidth({
    required double width,
    required Map<String, dynamic> map,
  }) {
    // confirm keys count
    if (breakPointLabels.length != map.keys.length) {
      throw FormatException(
          "BSBreakPoints:\nMust pass exactly the breakpoint labels as keys:\n${breakPointLabels.toString()}:\nYou passed:\n${map.keys.toString()}");
    }

    // confirm that all keys passed are valid
    for (int i = 0; i < breakPointLabels.length; i++) {
      if (!breakPointLabels.contains(map.keys.elementAt(i))) {
        throw FormatException(
            "BSBreakPoints:\nAll keys passed must be valid. Valid values are (must be lowercase):\n${breakPointLabels.toString()}:\nPassed:\n${map.keys.toString()}");
      }
    }

    // check from largest to smallest, which to return
    for (int i = breakPointLabels.length - 1; i > 0; i--) {
      if (width >= breakPoints[breakPointLabels[i]]!) {
        return map[breakPointLabels[i]];
      }
    }
    return map[breakPointLabels[0]];
  }

  /// returns a custom value based on the current screen size
  /// valid key values are (case sensitive, only lowercase)
  /// ''
  /// 'sm'
  /// 'md'
  /// 'lg'
  /// 'xl'
  /// 'xxl'
  static dynamic valueBasedOnBreakPoint({
    required BuildContext context,
    required Map<String, dynamic> map,
  }) {
    // get screen width
    double screenWidth = MediaQuery.of(context).size.width;
    return valueBasedOnBreakPointFromDefinedWidth(
      width: screenWidth,
      map: map,
    );
  }

  /// returns the last 2, or only last char of a string as a double
  /// only one if the 2nd last isn't a char
  static double _getSuffixNumbersValue(String value) {
    int lastIndex = value.length - 1;
    if (double.tryParse(value[lastIndex - 1]) != null) {
      return double.parse(value[lastIndex - 1] + value[lastIndex]);
    } else {
      return double.parse(value[lastIndex]);
    }
  }

  /// returns the current breakpoint label based on the screen width
  static String currentBreakPointLabel(BuildContext context) {
    // get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // check from largest to smallest
    for (int i = breakPointLabels.length - 1; i > 0; i--) {
      if (screenWidth >= breakPoints[breakPointLabels[i]]!) {
        return breakPointLabels[i];
      }
    }
    return breakPointLabels[0];
  }

  /// returns the width a column should be based on it's breakpoints
  /// ex: col-lg-6 would set width to 50% of container width when breakpoint is lg
  static double columnWidthFromBreakPointTriggers({
    required double maxWidth,
    required double screenWidth,
    required List<String> breakPointTriggers,
  }) {
    // set values to unset
    Map<String, double> map = <String, double>{
      "": maxWidth,
      "sm": -1,
      "md": -1,
      "lg": -1,
      "xl": -1,
      "xxl": -1,
    };

    // set explicit values
    for (int i = 0; i < breakPointTriggers.length; i++) {
      if (RegExp(r"^col$").firstMatch(breakPointTriggers[i]) != null) {
        map[""] = (1 / 12) * maxWidth;
      } else if (RegExp(r"^col-(([0-9])|([0-9][0-2]))$")
              .firstMatch(breakPointTriggers[i]) !=
          null) {
        map[""] =
            (_getSuffixNumbersValue(breakPointTriggers[i]) / 12) * maxWidth;
      } else {
        for (int r = 1; r < breakPointLabels.length; r++) {
          if (RegExp("^col-${breakPointLabels[r]}-(([0-9])|([0-9][0-2]))\$")
                  .firstMatch(breakPointTriggers[i]) !=
              null) {
            map[breakPointLabels[r]] =
                (_getSuffixNumbersValue(breakPointTriggers[i]) / 12) * maxWidth;
          }
        }
      }
    }

    // set inferred values
    for (int i = 1; i < breakPointLabels.length; i++) {
      if (map[breakPointLabels[i]] == -1) {
        map[breakPointLabels[i]] = map[breakPointLabels[i - 1]]!;
      }
    }

    return valueBasedOnBreakPointFromDefinedWidth(width: screenWidth, map: map);
  }

  /// Returns the size a text type should be based on the screen size.
  /// Can have a custom small and or large size passed, otherwise the
  /// default large and small sizes are used.
  /// The valid textType are:
  /// p
  /// h1
  /// h2
  /// h3
  /// h4
  /// h5
  /// h5
  static double getTextFontSize(
    BuildContext context,
    String textType, {
    double small = -1,
    double large = -1,
  }) {
    // confirm passed text type is valid
    if (!textTypes.contains(textType)) {
      throw FormatException(
          "BSBreakPoints:\nMust pass a valid textType. Valid text types (case sensitive):\n${textType.toString()}\nYou passed:\n$textType");
    }

    // confirm a valid small and large is passed
    if (small < -1) {
      throw FormatException(
          "BSBreakPoints:\nThe passed value for small must be >= -1, you passed:\n${small.toString()}");
    }
    if (large < -1) {
      throw FormatException(
          "BSBreakPoints:\nThe passed value for large must be >= -1, you passed:\n${large.toString()}");
    }

    // set small and large values to default if not explicitly set
    if (small == -1) {
      small = textTypesAndSizes[textType]!["sm"]!;
    }
    if (large == -1) {
      large = textTypesAndSizes[textType]!["lg"]!;
    }

    // return size based on current screen size
    return valueBasedOnBreakPoint(
      context: context,
      map: {
        "": small,
        "sm": small,
        "md": large,
        "lg": large,
        "xl": large,
        "xxl": large,
      },
    );
  }

  /// returns a width based on the current context's width
  /// "", sm = 300
  /// md = 500
  /// lg, xl = 800
  /// xxl = 1140
  static double getDynamicModalWidth(BuildContext context) {
    return valueBasedOnBreakPoint(
      context: context,
      map: <String, double>{
        "": modalTypesAndSizes[modalTypes[0]]!,
        "sm": modalTypesAndSizes[modalTypes[0]]!,
        "md": modalTypesAndSizes[modalTypes[1]]!,
        "lg": modalTypesAndSizes[modalTypes[2]]!,
        "xl": modalTypesAndSizes[modalTypes[2]]!,
        "xxl": modalTypesAndSizes[modalTypes[3]]!,
      },
    );
  }

  /// returns the width a modal should be based on the passed type
  /// sm = 300
  /// md = 500
  /// lg = 800
  /// xl = 1140
  static double getModalWidthBasedOnType(String type) {
    if (!modalTypes.contains(type)) {
      throw FormatException(
          "BSBreakPoints:\nMust pass a valid modal type (case sensitive):\n${modalTypes.toString()}\nYou passed:\n$type");
    }
    return modalTypesAndSizes[type]!;
  }
}
