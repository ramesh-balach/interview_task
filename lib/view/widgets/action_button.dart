import 'package:flutter/material.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class ActionButton extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const ActionButton({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(icon),
          ),
          Gap.v(4),
          CustomTextWidget(text: title, color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }
}
