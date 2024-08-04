import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/models/versionModel.dart';
import 'package:truetech/screens/optionScreen.dart';
import 'package:truetech/utils/colors.dart';

class VersionComponent extends StatelessWidget {
  final VersionModel version;
  VersionComponent(this.version);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Optionscreen(version),
              ));
        },
        child: Container(
            height: 92.h,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  version.image,
                  height: 90.h,
                  width: 90.h,
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(
                      version.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: darkColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 25.r,
                    color: darkColor,
                  ),
                ),
              ],
            )));
  }
}
