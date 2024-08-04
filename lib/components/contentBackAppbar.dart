import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/components/SearchWidget.dart';
import 'package:truetech/utils/colors.dart';

class ContentBackAppBarWidget extends StatelessWidget {
  final String title;
  final TextEditingController search;
  final Function(String) onSubmitted;
  final VoidCallback onPressed;
  ContentBackAppBarWidget(this.title, this.search, this.onSubmitted, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Icon(FontAwesomeIcons.chevronLeft,
                    color: darkColor, size: 32.sp),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: darkColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SearchWidget(search, "Rechercher...", onSubmitted)
        ],
      ),
    );
  }
}
