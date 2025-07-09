import 'package:flutter/material.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _statColumn(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: label,
            color: Colors.grey,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          Gap.v(4),
          CustomTextWidget(
            text: value,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statColumn('Open', '342.43'),
              _statColumn('High', '346.56'),
              _statColumn('Low', '296.36'),
            ],
          ),
          const Divider(height: 24, thickness: 0.5),
          // Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statColumn('Volume', '873.298'),
              _statColumn('Avg. Volume', '983.321'),
              _statColumn('Market Cap', '567.432'),
            ],
          ),
        ],
      ),
    );
  }
}
