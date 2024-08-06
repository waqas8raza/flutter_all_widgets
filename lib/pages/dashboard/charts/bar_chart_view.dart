import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartView extends StatelessWidget {
  const BarChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 8,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 10,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 14,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 15,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 13,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 10,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
        ],
        titlesData: const FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
              ),
            )),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey),
        ),
        gridData: const FlGridData(show: true),
      ),
    );
  }
}
