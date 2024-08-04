import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/components/buttonWidget.dart';
import 'package:truetech/screens/HomeScreen.dart';
import 'package:truetech/screens/connectionScreen.dart';
import 'package:truetech/utils/colors.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});
  static const routeName = "/StartingScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              bgColor,
              lightGrayColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(70.w, 200.h, 70.w, 0),
                child: Image.asset(
                  "assets/images/horizontal_logo.png",
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/hand-phone.png",
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(right: 25.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 250.h),
                    Buttonwidget(false, darkColor, lightColor, "Client", 150,
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    }),
                    SizedBox(height: 40.h),
                    Buttonwidget(
                        false, darkColor, lightColor, "Fourniseur", 150, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConnectionScreen(),
                          ));
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
