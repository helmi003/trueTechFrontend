import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/models/selectedOptionModel.dart';
import 'package:truetech/utils/colors.dart';

class SelectedOptions extends StatelessWidget {
  final SelectedOptionModel selectedOption;
  final VoidCallback removeOption;
  SelectedOptions(this.selectedOption, this.removeOption);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: darkColor.withOpacity(0.25),
                  offset: Offset(0.w, 4.h),
                  blurRadius: 4.r,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(child: Image.asset(selectedOption.option.image)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Text(
                    selectedOption.option.title,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: darkColor),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -10,
            left: -10,
            child: CircleAvatar(
              backgroundColor: greenColor,
              radius: 13.r,
              child: Text(
                selectedOption.quantity.toString(),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: lightColor),
              ),
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: CircleAvatar(
              backgroundColor: darkColor.withOpacity(0.5),
              radius: 13.r,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: removeOption,
                icon: Icon(
                  FontAwesomeIcons.xmark,
                  color: lightColor,
                  size: 15.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
