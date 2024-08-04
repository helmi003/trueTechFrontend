import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomTextfield(
      this.label, this.icon,this.type, this.controller, this.validator, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: grayColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          keyboardType: type,
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
            hintText: label,
            hintStyle: TextStyle(color: silverColor, fontSize: 16.sp),
            suffixIcon: Icon(
              icon,
              color: silverColor,
              size: 18.sp,
            ),
          ),
          style: TextStyle(color: darkColor, fontSize: 16.sp),
        ),
      ],
    );
  }
}
