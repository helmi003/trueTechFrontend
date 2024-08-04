import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/models/phoneModel.dart';
import 'package:truetech/screens/versionScreen.dart';
import 'package:truetech/utils/colors.dart';

class Phonecomponent extends StatelessWidget {
  final PhoneModel phone;
  const Phonecomponent(this.phone);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VersionScreen(phone),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
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
        child: Image.asset(phone.image),
      ),
    );
  }
}
