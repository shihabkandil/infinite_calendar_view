import 'package:flutter/material.dart';

import '../../events_planner.dart';
import '../../painters/events_painters.dart';

class VerticalTimeIndicatorWidget extends StatelessWidget {
  const VerticalTimeIndicatorWidget({
    super.key,
    required this.timesIndicatorsParam,
    required this.heightPerMinute,
    required this.currentHourIndicatorHourVisibility,
    required this.currentHourIndicatorColor,
    this.textPainterBuilder,
  });

  final TimesIndicatorsParam timesIndicatorsParam;
  final double heightPerMinute;
  final bool currentHourIndicatorHourVisibility;
  final Color currentHourIndicatorColor;
  final TextPainter Function(TimeOfDay time, Color color)? textPainterBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: timesIndicatorsParam.timesIndicatorsWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: timesIndicatorsParam.timesIndicatorsHorizontalPadding),
        child: CustomPaint(
          foregroundPainter: timesIndicatorsParam.timesIndicatorsCustomPainter
                  ?.call(heightPerMinute) ??
              HoursPainter(
                heightPerMinute: heightPerMinute,
                showCurrentHour: currentHourIndicatorHourVisibility,
                hourColor: Theme.of(context).colorScheme.outline,
                halfHourColor: Theme.of(context).colorScheme.outlineVariant,
                quarterHourColor: Theme.of(context).colorScheme.outlineVariant,
                currentHourIndicatorColor: currentHourIndicatorColor,
                textPainterBuilder: textPainterBuilder,
              ),
        ),
      ),
    );
  }
}
