import 'package:flutter/material.dart';
import 'package:bootstrap_like_breakpoints/bootstrap_like_breakpoints.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Boostrap Like Breakpoints Example",
                textAlign: TextAlign.center,
              ),
              Text(
                "See values displayed below",
                textAlign: TextAlign.center,
              ),
              Text(
                "_breakPointLabels",
              ),
              Text(
                "${BSBreakPoints.getBreakPointLabels().toString()}",
              ),
              Text(
                "_breakPoints",
              ),
              Text(
                "screen width >= to breakpoint value",
              ),
              Text(
                "${BSBreakPoints.getBreakPoints().toString()}",
              ),
              Text(
                "_containerWidths",
              ),
              Text(
                "${BSBreakPoints.getContainerWidths().toString()}",
              ),
              Text(
                "valueBasedOnBreakPoint",
              ),
              Text(
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
            ],
          );
        },
      ),
    ),
  ));
}
