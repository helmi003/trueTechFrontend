import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/utils/colors.dart';

class IncreamentDecrement extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final num number;
  IncreamentDecrement(this.increment, this.decrement, this.number);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: decrement,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: [
                BoxShadow(
                  color: darkColor.withOpacity(0.25),
                  offset: Offset(0.w, 4.h),
                  blurRadius: 4.r,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Icon(
              FontAwesomeIcons.minus,
              size: 25.sp,
              color: lightColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            number.toString(),
            style: TextStyle(
                fontSize: 20.sp, fontWeight: FontWeight.w500, color: darkColor),
          ),
        ),
        GestureDetector(
          onTap: increment,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: [
                BoxShadow(
                  color: darkColor.withOpacity(0.25),
                  offset: Offset(0.w, 4.h),
                  blurRadius: 4.r,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Icon(
              FontAwesomeIcons.plus,
              size: 25.sp,
              color: lightColor,
            ),
          ),
        ),
      ],
    );
  }
}
