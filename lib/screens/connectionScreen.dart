import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/components/backAppbar.dart';
import 'package:truetech/components/buttonWidget.dart';
import 'package:truetech/components/customPasswordField.dart';
import 'package:truetech/components/customTextField.dart';
import 'package:truetech/screens/inscriptionScreen.dart';
import 'package:truetech/utils/colors.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obsecure = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  BackAppbar("Connectez-vous", () {
                    Navigator.of(context).pop();
                  }),
                  SizedBox(height: 80.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 160.w),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Text(
                    'Bon retour',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: darkColor),
                  ),
                  Text(
                    'Connectez-vous pour accéder à votre compte',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: darkColor,
                    ),
                  ),
                  SizedBox(height: 80.h),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                    child: CustomTextfield("E-mail", FontAwesomeIcons.envelope,
                        TextInputType.emailAddress, email, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre email';
                      } else if (!EmailValidator.validate(email.text)) {
                        return "Ce n'est pas un email correct";
                      }
                      return null;
                    }, (value) {
                      formKey.currentState?.validate();
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomPasswordField(
                        "Mot de passe", obsecure, password, () {
                      setState(() {
                        obsecure = !obsecure;
                      });
                    }, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      }
                      return null;
                    }, (value) {
                      formKey.currentState?.validate();
                    }),
                  ),
                  SizedBox(height: 150.h),
                  Buttonwidget(false, lightColor, grayColor, "Connexion", 300.w,
                      () {
                    if (formKey.currentState?.validate() ?? false) {
                      print("Logging in");
                    }
                  }),
                  SizedBox(height: 10.h),
                  RichText(
                    text: TextSpan(
                        text: "Nouveau membre?",
                        style: TextStyle(fontSize: 13.sp, color: darkColor),
                        children: [
                          TextSpan(
                              text: " Inscrivez-vous maintenant",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InscriptionScreen()));
                                },
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: redColor))
                        ]),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
