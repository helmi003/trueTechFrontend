import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/utils/colors.dart';

class CopyRightText extends StatelessWidget {
  const CopyRightText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "© 2024 TrueTech.Tous droits réservés. La reproduction ou la distribution non autorisée de cette application ou de toute partie de celle-ci peut entraîner des sanctions civiles et pénales sévères et sera poursuivie dans toute la mesure permise par la loi.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: grayColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
