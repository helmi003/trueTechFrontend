import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/utils/colors.dart';

class BillText extends StatelessWidget {
  final String title;
  final double titleSize;
  final String number;
  final double numberSize;
  final FontWeight fontWeight;
  const BillText(this.title, this.number, this.titleSize, this.numberSize,
      this.fontWeight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: titleSize.sp, fontWeight: fontWeight, color: grayColor),
        ),
        Row(
          children: [
            Text(
              number.toString(),
              style: TextStyle(
                  fontSize: numberSize.sp,
                  fontWeight: fontWeight,
                  color: grayColor),
            ),
            SizedBox(width: 15.w),
            Text(
              "TND",
              style: TextStyle(
                  fontSize: numberSize.sp,
                  fontWeight: fontWeight,
                  color: grayColor),
            ),
          ],
        ),
      ],
    );
  }
}
