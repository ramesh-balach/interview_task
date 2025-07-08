import 'package:flutter/material.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/widgets/text_widget.dart';

class MiningHeaderCard extends StatefulWidget {
  final String balance;
  const MiningHeaderCard({super.key, required this.balance});

  @override
  State<MiningHeaderCard> createState() => _MiningHeaderCardState();
}

class _MiningHeaderCardState extends State<MiningHeaderCard> {
  String selectedValue = 'Month';
  final List<String> options = ['Day', 'Week', 'Month', 'Year'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Mining Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: 'Your Mining', fontSize: 12.sp, color: Colors.grey,),
              SizedBox(height: 4),
             CustomTextWidget(text: 'USDT ${widget.balance}', fontWeight: FontWeight.w600, fontSize: 16.sp,)
            ],
          ),

          // Right: Dropdown
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                padding: EdgeInsets.zero,
                isDense: true,
                value: selectedValue,
                icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 20, color: Colors.black,),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedValue = value;
                    });
                  }
                },
                items: options
                    .map((label) => DropdownMenuItem(
                  value: label,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: CustomTextWidget(text: label, fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.black,),
                  ),
                ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
