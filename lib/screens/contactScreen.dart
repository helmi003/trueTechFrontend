import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truetech/components/backAppbar.dart';
import 'package:truetech/components/buttonWidget.dart';
import 'package:truetech/components/copyRightText.dart';
import 'package:truetech/components/customTextArea.dart';
import 'package:truetech/components/customTextField.dart';
import 'package:truetech/utils/colors.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController message = TextEditingController();
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
                  BackAppbar("Contactez nous", () {
                    Navigator.of(context).pop();
                  }),
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
                    child: CustomTextArea(message, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre message';
                      }
                      return null;
                    }, (value) {
                      formKey.currentState?.validate();
                    }),
                  ),
                  SizedBox(height: 10.h),
                  Buttonwidget(false, lightColor, grayColor, "Envoyez", 300.w,
                      () {
                    if ((formKey.currentState?.validate() ?? false)) {
                      print("Logging in");
                    }
                  }),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Image.asset("assets/images/horizontal_logo.png"),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: CopyRightText())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
