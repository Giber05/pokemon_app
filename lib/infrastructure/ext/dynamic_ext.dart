import 'package:flutter/material.dart';
import 'package:pokemon_app/infrastructure/responsive/layout_breakpoint.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension DynamicExt<T extends dynamic> on T {
  T responsive(BuildContext context, {T? xs, T? sm, T? md, T? lg}) {
    final value = this;
    return ResponsiveValue(context,
                defaultValue: value,
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
            .value ??
        value;
  }
}
