import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pokemon_app/infrastructure/responsive/layout_breakpoint.dart';

class LayoutResponsive {
  static T? value<T>(BuildContext context,
      {T? xs, T? sm, T? md, T? lg, T? defaultValue}) {
    return ResponsiveValue(context,
            defaultValue: defaultValue,
            valueWhen: LayoutBreakpoint.values
                .map(
                  (e) => Condition.largerThan(
                    name: e.name,
                    breakpoint: e.breakPoint,
                    value: e.mapBreakPoint(
                      xs: xs,
                      sm: sm,
                      md: md,
                      lg: lg,
                    ),
                  ),
                )
                .toList())
        .value;
  }
}
