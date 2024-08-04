import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/components/buttonWidget.dart';
import 'package:truetech/utils/colors.dart';

class YesOrNoPopup extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  YesOrNoPopup(
      this.title, this.description, this.icon, this.color, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 70.h, 20.w, 20.h),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: darkColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: silverColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Buttonwidget(
                      false,
                      darkColor,
                      platColor,
                      "Non",
                      130,
                      () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Buttonwidget(
                      false,
                      lightColor,
                      color,
                      "Oui",
                      130,
                      onPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -80.h,
            child: CircleAvatar(
              backgroundColor: color.withOpacity(0.5),
              radius: 80.r,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 74.r,
                child: Icon(
                  icon,
                  size: 74.sp,
                  color: lightColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
