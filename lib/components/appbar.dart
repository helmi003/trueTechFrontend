// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/components/backAppbar.dart';
import 'package:truetech/screens/phoneScreen.dart';
import 'package:truetech/screens/stratingScreen.dart';
import 'package:truetech/utils/colors.dart';

class HomeAppBarWidget extends StatelessWidget {
  HomeAppBarWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackAppbar("Acceuil", () {
            Navigator.pushReplacementNamed(context, StartingScreen.routeName);
          }),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Phonescreen(),
                  ));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.w,
                  vertical: 16.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: grayColor,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: platColor,
                      size: 20.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Rechercher...",
                      style: TextStyle(color: platColor, fontSize: 20.sp),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
