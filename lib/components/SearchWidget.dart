// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/utils/colors.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController search;
  final String hint;
  final Function(String) onSubmitted;
  const SearchWidget(this.search, this.hint, this.onSubmitted);

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: darkColor,
        controller: search,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 19.w,
            vertical: 16.h,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: grayColor),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: grayColor)),
          hintText: hint,
          hintStyle: TextStyle(color: platColor, fontSize: 20.sp),
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: platColor,
            size: 20.sp,
          ),
        ),
        onChanged: onSubmitted,
        style: TextStyle(color: darkColor, fontSize: 20.sp));
  }
}
