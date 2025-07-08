import 'package:flutter/material.dart';
import 'package:interview_task/res/app_assets.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AppAssets.userAvatar),
        ),
        Gap.h(13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: 'Hi David James', fontSize: 16.sp, fontWeight: FontWeight.bold,),
            CustomTextWidget(text: 'Have a good day', fontSize: 12.sp),
          ],
        ),
        const Spacer(),
        Image.asset(AppAssets.bellIcon)
      ],
    );
  }
}
