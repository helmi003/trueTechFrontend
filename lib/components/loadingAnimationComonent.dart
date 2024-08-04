import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:truetech/utils/colors.dart';

class LoadingAnimationComponent extends StatelessWidget {
  const LoadingAnimationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.staggeredDotsWave(
              color: grayColor, size: 60.sp),
          Text(
            "Chargement...",
            style: TextStyle(fontSize: 16.sp, color: platColor),
          )
        ],
      ),
    );
  }
}
