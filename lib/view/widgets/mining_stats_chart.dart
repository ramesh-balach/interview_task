import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/res/app_assets.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class MiningStatsChart extends StatelessWidget {
  const MiningStatsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['1D', '1W', '1M', '1Y', '5Y'].map((e) {
              bool isSelected = e == '1M';
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomTextWidget(
                  text: e,
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              );
            }).toList(),
          ),
        ),

        // Candle Chartt
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 3500,
                minY: 1000,
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false), // Hide left Y-axis
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, _) => CustomTextWidget(
                        text: value.toInt().toString(),
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                      interval: 500,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        final labels = [
                          '14 Sep',
                          '18 Sep',
                          '22 Sep',
                          '26 Sep',
                          '30 Sep',
                          '3 Oct',
                        ];
                        int index = value.toInt();
                        if (index >= 0 && index < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CustomTextWidget(
                              text: labels[index],
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),

                barGroups: _getCandleBarGroups(),
              ),
            ),
          ),
        ),

        Gap.v(24),

        // Bottom Stats
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.miningIcon),
                      Gap.h(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Total Mining',
                            color: Colors.grey,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomTextWidget(
                            text: '\$ 1,200.45',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.refferalIcon),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Referral Bonus',
                            color: Colors.grey,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomTextWidget(
                            text: '\$ 2000.43',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  List<BarChartGroupData> _getCandleBarGroups() {
    // Simulated candle data: x, open, close, high, low
    final data = [
      [0, 1500, 1800, 1850, 1400],
      [1, 1800, 1700, 1900, 1600],
      [2, 1700, 2000, 2100, 1650],
      [3, 2000, 2400, 2500, 1950],
      [4, 2400, 2300, 2600, 2200],
      [5, 2300, 3200, 3300, 2250],
    ];

    return data.map((item) {
      final x = item[0].toDouble();
      final open = item[1].toDouble();
      final close = item[2].toDouble();
      final high = item[3].toDouble();
      final low = item[4].toDouble();

      final isGain = close >= open;
      final barColor = isGain ? Colors.green : Colors.red;
      final width = 6.0;

      return BarChartGroupData(
        x: x.toInt(),
        barRods: [
          BarChartRodData(
            toY: high,
            fromY: low,
            color: Colors.grey.shade600,
            width: 1, // Wick
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: isGain ? close : open,
            fromY: isGain ? open : close,
            width: width,
            color: barColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ],
      );
    }).toList();
  }
}
