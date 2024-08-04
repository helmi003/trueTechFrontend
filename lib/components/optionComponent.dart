import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/components/increamentDecrement.dart';
import 'package:truetech/components/richTextComponent.dart';
import 'package:truetech/models/optionModel.dart';
import 'package:truetech/utils/colors.dart';

class OptionComponent extends StatelessWidget {
  final OptionModel option;
  final num quantity;
  final VoidCallback increment;
  final VoidCallback decrement;
  OptionComponent(this.option, this.quantity, this.increment, this.decrement);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 170.h,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: seaSaltColor,
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
              child: Image.asset(
                option.image,
                width: 170.w,
                height: 170.h,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: darkColor),
                    ),
                    SizedBox(height: 5.h),
                    RichTextComponent("Model: ", option.model),
                    RichTextComponent("Type: ", option.type),
                    RichTextComponent("Prix: ", "${option.prix} TND/piéce"),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IncreamentDecrement(increment, decrement, quantity),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
