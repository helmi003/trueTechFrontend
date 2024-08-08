import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/utils/colors.dart';

class CustomTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomTextArea(this.controller, this.validator, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Message",
          style: TextStyle(
            color: grayColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          maxLines: 4,
          maxLength: 250,
          cursorColor: darkColor,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: silverColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: silverColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: redColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: redColor),
            ),
            hintText: "Veuillez décrire votre situation ici.",
            hintStyle: TextStyle(color: silverColor, fontSize: 16.sp),
          ),
          style: TextStyle(color: darkColor, fontSize: 16.sp),
        ),
      ],
    );
  }
}
