import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/components/increamentDecrement.dart';
import 'package:truetech/models/selectedOptionModel.dart';
import 'package:truetech/utils/colors.dart';

class BillComponent extends StatelessWidget {
  final SelectedOptionModel option;
  final VoidCallback increment;
  final VoidCallback decrement;
  final VoidCallback removeOption;
  BillComponent(this.option, this.increment, this.decrement, this.removeOption);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90.h,
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
                  "assets/images/iphone-12-carte-mère.jpg",
                  width: 90.w,
                  height: 90.h,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              option.option.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: darkColor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              option.option.prix.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: darkPurpleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      IncreamentDecrement(
                        increment,
                        decrement,
                        option.quantity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
    );
  }
}
