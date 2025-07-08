import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/res/app_assets.dart';
import 'package:interview_task/res/app_colors.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Your Balance',
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
                Row(
                  children: [
                    Image.asset(AppAssets.coin, width: 30.w, height: 30.h),
                    Gap.h(10),
                    CustomTextWidget(
                      text: '5,790.54',
                      color: Colors.white,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Image.asset(AppAssets.leaderboardIcon, width: 52.w, height: 52.h,),
                        CustomTextWidget(text: 'Leaderboard', fontSize: 8.sp, color: Colors.white,)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(AppAssets.line)
        ],
      ),
    );
  }
}
