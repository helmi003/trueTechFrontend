// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/utils/colors.dart';

class Buttonwidget extends StatelessWidget {
  final bool isLoading;
  final String text;
  final Color textColor;
  final Color color;
  final double width;
  final VoidCallback onPressed;
  Buttonwidget(
      this.isLoading,this.textColor, this.color, this.text, this.width, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextButton(
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? CircularProgressIndicator(color: lightColor, strokeWidth: 4)
            : Text(
                text,
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    );
  }
}
