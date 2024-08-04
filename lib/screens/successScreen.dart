import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/screens/HomeScreen.dart';
import 'package:truetech/utils/colors.dart';

class Successscreen extends StatefulWidget {
  const Successscreen({super.key});
  static const routeName = "/Successscreen";

  @override
  State<Successscreen> createState() => _SuccessscreenState();
}

class _SuccessscreenState extends State<Successscreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat(reverse: true);

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: greenColor,
                  radius: 110.r,
                  child: Icon(
                    FontAwesomeIcons.check,
                    size: 150.sp,
                    color: lightColor,
                  ),
                ),
                Positioned(
                  top: -50,
                  left: 30,
                  child: CircleAvatar(
                    backgroundColor: greenColor,
                    radius: 10.r,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: -40,
                  child: CircleAvatar(
                    backgroundColor: greenColor,
                    radius: 15.r,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: -20,
                  child: CircleAvatar(
                    backgroundColor: greenColor,
                    radius: 5.r,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            Text(
              "Félicitation!",
              style: TextStyle(fontSize: 50.sp, color: greenColor),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Commande passée",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: greenColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "avec succès",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: greenColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
