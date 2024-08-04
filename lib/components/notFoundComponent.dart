import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/utils/colors.dart';

class Notfoundcomponent extends StatelessWidget {
  const Notfoundcomponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no-results.png",
          height: 115.h,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Pas de résultat",
          style: TextStyle(
              fontSize: 26.sp, fontWeight: FontWeight.w500, color: darkColor),
        ),
      ],
    );
  }
}
