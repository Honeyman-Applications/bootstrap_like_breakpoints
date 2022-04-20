import 'package:flutter/material.dart';
import 'package:bootstrap_typography2/bootstrap_typography2.dart';
import 'package:bootstrap_like_breakpoints/bootstrap_like_breakpoints.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              H1(
                BSTextParams(
                  "Boostrap Like Breakpoints Example",
                  textAlignment: TextAlign.center,
                ),
              ),
              H3(
                BSTextParams(
                  "See values displayed below",
                  textAlignment: TextAlign.center,
                ),
              ),
              H2(
                BSTextParams(
                  "_breakPointLabels",
                ),
              ),
              P(
                BSTextParams(
                  "${BSBreakPoints.getBreakPointLabels().toString()}",
                ),
              ),
              H2(
                BSTextParams(
                  "_breakPoints",
                ),
              ),
              P(
                BSTextParams("screen width >= to breakpoint value"),
              ),
              P(
                BSTextParams(
                  "${BSBreakPoints.getBreakPoints().toString()}",
                ),
              ),
              H2(
                BSTextParams(
                  "_containerWidths",
                ),
              ),
              P(
                BSTextParams(
                  "${BSBreakPoints.getContainerWidths().toString()}",
                ),
              ),
              H2(
                BSTextParams("valueBasedOnBreakPoint"),
              ),
              P(
                BSTextParams(
                  BSBreakPoints.valueBasedOnBreakPoint(
                    context: context,
                    map: <String, dynamic>{
                      "": "",
                      "sm": "sm",
                      "md": "md",
                      "lg": "lg",
                      "xl": "xl",
                      "xxl": "xxl",
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  ));
}
