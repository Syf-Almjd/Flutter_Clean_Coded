import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Finance Page'),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 300,
            child: Text("300RM"),
          ),
          LineChart(
            LineChartData(
                // read about it in the LineChartData section
                ),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          )
        ],
      ),
    );
  }
}
