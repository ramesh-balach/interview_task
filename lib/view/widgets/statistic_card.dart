import 'package:flutter/material.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/stats_card.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomTextWidget(
              text: 'Statistics',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            Spacer(),
            CustomTextWidget(text: 'More', fontSize: 10.sp, color: Colors.blue),
          ],
        ),
        Gap.v(20),
        StatsCard(),
      ],
    );
  }
}
