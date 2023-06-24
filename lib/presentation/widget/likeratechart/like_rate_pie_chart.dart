
import 'package:client/domain/likerate.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LikeRatePieChartWidget extends StatefulWidget {
  final LikeRates likeRates;

  const LikeRatePieChartWidget({
    required this.likeRates,
    super.key,
  });

  @override
  State<LikeRatePieChartWidget> createState() => LikeRatePieChartWidgetState();
}

class LikeRatePieChartWidgetState extends State<LikeRatePieChartWidget> {
  static final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex = pieTouchResponse
                  .touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        sections: showingSections(),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.likeRates.count(), (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: colors[i],
        value: widget.likeRates.likeRates[i].rate,
        title: widget.likeRates.likeRates[i].fieldName + " (" + widget.likeRates.likeRates[i].rate.toString() + ")",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }
}
