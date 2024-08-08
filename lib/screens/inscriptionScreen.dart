import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/components/backAppbar.dart';
import 'package:truetech/components/buttonWidget.dart';
import 'package:truetech/components/customPasswordField.dart';
import 'package:truetech/components/customTextField.dart';
import 'package:truetech/utils/colors.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool obsecurePassword = true;
  bool obsecureConfirmPassword = true;
  bool? terms = false;
  bool termsNotAccepted = false;
  final formKey = GlobalKey<FormState>();
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
                  BackAppbar("Inscrivez-vous", () {
                    Navigator.of(context).pop();
                  }),
                  SizedBox(height: 30.h),
                  Text(
                    'Commencez maintenant',
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: darkColor),
                  ),
                  Text(
                    'en créant un compte gratuit.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: darkColor,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                    child: CustomTextfield(
                        "Nom et prénom",
                        FontAwesomeIcons.user,
                        TextInputType.name,
                        fullName, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre nom et prénom';
                      }
                      return null;
                    }, (value) {
                      formKey.currentState?.validate();
                    }),
                  ),
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
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                    child: CustomTextfield(
                        "Téléphone",
                        FontAwesomeIcons.phoneFlip,
                        TextInputType.phone,
                        phone, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre numéro téléphone';
                      } else if (value.length != 8) {
                        return 'le numéro de téléphone doit contenir 8 chiffres';
                      }
                      return null;
                    }, (value) {
                      formKey.currentState?.validate();
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                    child: CustomPasswordField(
                        "Mot de passe", obsecurePassword, password, () {
                      setState(() {
                        obsecurePassword = !obsecurePassword;
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomPasswordField("Confirmer mot de passe",
                        obsecureConfirmPassword, confirmPassword, () {
                      setState(() {
                        obsecureConfirmPassword = !obsecureConfirmPassword;
                      });
                    }, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre mot de passe de confirmation';
                      } else if (confirmPassword.text != password.text) {
                        return 'Confirmer votre mot de passe';
                      }
                      return null;
                    }, (value) {
                      formKey.currentState?.validate();
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Checkbox(
                              value: terms,
                              activeColor: greenColor,
                              onChanged: (newBool) {
                                setState(() {
                                  terms = newBool;
                                });
                              }),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      "En cochant cette case, vous acceptez nos ",
                                  style: TextStyle(
                                      fontSize: 13.sp, color: darkColor),
                                  children: [
                                    TextSpan(
                                        text: "Termes",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print("taped");
                                          },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: redColor)),
                                    TextSpan(
                                      text: " et ",
                                    ),
                                    TextSpan(
                                        text: "Conditions",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print("taped");
                                          },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: redColor))
                                  ]),
                              maxLines: null,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ]),
                        termsNotAccepted
                            ? Text(
                                'Vous devez accepter les termes et conditions pour continuer',
                                style:
                                    TextStyle(fontSize: 13.sp, color: redColor),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Buttonwidget(
                      false, lightColor, grayColor, "Inscription", 300.w, () {
                    if ((formKey.currentState?.validate() ?? false)) {
                      if (terms == false) {
                        setState(() {
                          termsNotAccepted = true;
                        });
                      } else {
                        setState(() {
                          termsNotAccepted = false;
                        });
                        print("Logging in");
                      }
                    }
                  }),
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
