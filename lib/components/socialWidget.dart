// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/components/PopUp.dart';
import 'package:truetech/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Socialwidget extends StatelessWidget {
  final String image;
  final String link;
  Socialwidget(this.image, this.link);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        "assets/images/$image.png",
        height: 70.h,
      ),
      onTap: () async {
        try {
          await launchUrl(Uri.parse(link));
        } catch (error) {
          showDialog(
            context: context,
            builder: (context) => Popup("Error", "Ce lien n'est pas accessible",
                FontAwesomeIcons.xmark, redColor),
          );
        }
      },
    );
  }
}
