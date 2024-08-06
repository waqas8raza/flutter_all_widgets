import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartView extends StatelessWidget {
  PieChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 40,
            title: '40%',
            color: Colors.blue,
            radius: 50,
          ),
          PieChartSectionData(
            value: 30,
            title: '30%',
            color: Colors.red,
            radius: 50,
          ),
          PieChartSectionData(
            value: 20,
            title: '20%',
            color: Colors.green,
            radius: 50,
          ),
          PieChartSectionData(
            value: 10,
            title: '10%',
            color: Colors.yellow,
            radius: 50,
          ),
        ],
      ),
    );
  }
}
