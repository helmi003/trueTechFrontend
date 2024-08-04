import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/components/appbar.dart';
import 'package:truetech/components/buttonWidget.dart';
import 'package:truetech/components/copyRightText.dart';
import 'package:truetech/components/socialWidget.dart';
import 'package:truetech/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = "/HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            HomeAppBarWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Socialwidget(
                    "facebook", "https://www.facebook.com/helmi.benromdhane.9"),
                Socialwidget(
                    "instagram", "https://www.instagram.com/helmi_b.r/"),
                Socialwidget("whatsapp", ""),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Buttonwidget(false, lightColor, grayColor, "Contactez-nous", 200,
                () {
              print("text");
            }),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Image.asset(
                "assets/images/horizontal_logo.png",
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: CopyRightText())
          ]),
        ),
      ),
    );
  }
}
