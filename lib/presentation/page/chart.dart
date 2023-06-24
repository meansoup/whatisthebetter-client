import 'package:client/domain/likerate.dart';
import 'package:client/presentation/widget/likeratechart/like_rate_pie_chart.dart';
import 'package:flutter/material.dart';

class ChartSample extends StatefulWidget {
  const ChartSample({super.key});

  @override
  State<StatefulWidget> createState() => ChartSampleState();
}

class ChartSampleState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: LikeRatePieChartWidget(likeRates: LikeRates(
                  [
                    LikeRate("A", 14.7),
                    LikeRate("B", 25.3),
                    LikeRate("C", 8.8),
                    LikeRate("D", 31.2),
                    LikeRate("E", 20.0),
                  ]
              )),
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }
}
