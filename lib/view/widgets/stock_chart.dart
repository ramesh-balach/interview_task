import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class StockChart extends StatefulWidget {
  final double? height;

  const StockChart({Key? key, this.height}) : super(key: key);

  @override
  State<StockChart> createState() => _StockChartState();
}

class _StockChartState extends State<StockChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: widget.height ?? 300,
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 4,
            minY: 0,
            maxY: 1,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 0.6454), // Open
                  FlSpot(1, 0.7554), // High
                  FlSpot(2, 0.6565), // Avg
                  FlSpot(3, 0.245),  // Low
                  FlSpot(4, 0.4322), // Vol
                ],
                isCurved: true,
                color: Colors.blue,
                barWidth: 2,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: Colors.blue,
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    );
                  },
                ),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,
                  interval: 0.1, // Force some visible values
                  getTitlesWidget: (value, meta) {
                    // Show only 0.2 to 0.8 range
                    if (value < 0.2 || value > 0.8) return const SizedBox.shrink();

                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CustomTextWidget(
                        text: value.toStringAsFixed(2),
                        fontSize: 10.sp,
                      ),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1, // Ensure only integer positions are shown
                  getTitlesWidget: (value, meta) {
                    const titles = ['Open', 'High', 'Avg', 'Low', 'Vol'];
                    int index = value.toInt();

                    if (value % 1 != 0 || index < 0 || index >= titles.length) {
                      return const SizedBox.shrink(); // Prevent duplicate or floating point titles
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CustomTextWidget(
                        text: titles[index],
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    );
                  },
                ),
              ),

            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}