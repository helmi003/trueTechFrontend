import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/utils/colors.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final bool obsecure;
  final TextEditingController controller;
  final VoidCallback setObsecure;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomPasswordField(this.label, this.obsecure, this.controller,
      this.setObsecure, this.validator, this.onChanged);

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
          keyboardType: TextInputType.visiblePassword,
          cursorColor: darkColor,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          obscureText: obsecure,
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
            suffixIcon: InkWell(
              onTap: setObsecure,
              child: Icon(
                  obsecure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  color: silverColor,
                  size: 18.sp),
            ),
          ),
          style: TextStyle(color: darkColor, fontSize: 16.sp),
        ),
      ],
    );
  }
}
