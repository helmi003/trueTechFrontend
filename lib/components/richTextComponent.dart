import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/utils/colors.dart';

class RichTextComponent extends StatelessWidget {
  final String text;
  final String content;
  const RichTextComponent(this.text, this.content);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: 18.sp, fontWeight: FontWeight.w500, color: grayColor),
          children: [
            TextSpan(
                text: content,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: silverColor))
          ]),
      maxLines: null,
      overflow: TextOverflow.clip,
    );
  }
}
