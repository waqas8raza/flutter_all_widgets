import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 1),
              const FlSpot(1, 3),
              const FlSpot(2, 10),
              const FlSpot(3, 7),
              const FlSpot(4, 12),
              const FlSpot(5, 13),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(sideTitles:  SideTitles(showTitles: true,reservedSize: 44)),
          rightTitles: AxisTitles(sideTitles:  SideTitles(showTitles: true,reservedSize: 44)),
          topTitles: AxisTitles(sideTitles:  SideTitles(showTitles: true,reservedSize: 44)),
          bottomTitles: AxisTitles(sideTitles:  SideTitles(showTitles: true,reservedSize: 44)),
         
        ),
        gridData: const FlGridData(show: true),
        borderData: FlBorderData(show: true),
      ),
    );
  }
}
