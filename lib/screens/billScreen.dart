import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:truetech/components/backAppbar.dart';
import 'package:truetech/components/billComponent.dart';
import 'package:truetech/components/billText.dart';
import 'package:truetech/components/buttonWidget.dart';
import 'package:truetech/components/customTextField.dart';
import 'package:truetech/components/yesOrNoPopup.dart';
import 'package:truetech/models/optionModel.dart';
import 'package:truetech/models/selectedOptionModel.dart';
import 'package:truetech/screens/SuccessScreen.dart';
import 'package:truetech/services/optionProvider.dart';
import 'package:truetech/utils/colors.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final formKey = GlobalKey<FormState>();
  bool? distribution = false;
  bool? delivery = false;
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  List<SelectedOptionModel> selectedOptions = [];
  num deliveryPrice = 7;
  num distributionPrice = 30;
  num total = 0;

  @override
  void initState() {
    super.initState();
    selectedOptions =
        Provider.of<OptionProvider>(context, listen: false).selectedOptions;
    total = getTotal();
  }

  void _incrementOption(OptionModel option) {
    setState(() {
      int index = selectedOptions.indexWhere((opt) => opt.option == option);
      if (index != -1) {
        var existingOption = selectedOptions[index];
        var updatedOption = SelectedOptionModel(
          option: existingOption.option,
          quantity: existingOption.quantity + 1,
        );
        selectedOptions[index] = updatedOption;
      } else {
        selectedOptions.add(SelectedOptionModel(option: option, quantity: 1));
      }
      total = getTotal();
    });
  }

  void _decrementOption(OptionModel option) {
    setState(() {
      int index = selectedOptions.indexWhere((opt) => opt.option == option);
      if (index != -1) {
        var existingOption = selectedOptions[index];
        if (existingOption.quantity > 1) {
          var updatedOption = SelectedOptionModel(
            option: existingOption.option,
            quantity: existingOption.quantity - 1,
          );
          selectedOptions[index] = updatedOption;
        } else {
          selectedOptions.remove(existingOption);
          if (selectedOptions.isEmpty) {
            Provider.of<OptionProvider>(context, listen: false).addToCart([]);
            Navigator.of(context).pop();
          }
        }
        total = getTotal();
      }
    });
  }

  num getTotal() {
    return selectedOptions.fold(
        0, (sum, article) => sum + article.option.prix * article.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: SafeArea(
                  child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackAppbar("Facture et formulaire", () {
                        Provider.of<OptionProvider>(context, listen: false)
                            .addToCart(selectedOptions);
                        Navigator.of(context).pop();
                      }),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Articles",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: darkColor),
                            ),
                            ListView.builder(
                              itemCount: selectedOptions.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.fromLTRB(20.w, 10.h, 0, 0),
                                child:
                                    BillComponent(selectedOptions[index], () {
                                  _incrementOption(
                                      selectedOptions[index].option);
                                }, () {
                                  _decrementOption(
                                      selectedOptions[index].option);
                                }, () {
                                  setState(() {
                                    selectedOptions.removeAt(index);
                                    total = getTotal();
                                    if (selectedOptions.isEmpty) {
                                      Provider.of<OptionProvider>(context,
                                              listen: false)
                                          .addToCart([]);
                                      Navigator.of(context).pop();
                                    }
                                  });
                                }),
                              ),
                            ),
                            Text(
                              "Formulaire",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: darkColor),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
                              child: CustomTextfield(
                                "Nom et prénom",
                                FontAwesomeIcons.user,
                                TextInputType.name,
                                userName,
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer votre nom et prénom';
                                  }
                                  return null;
                                },
                                (value) {
                                  formKey.currentState?.validate();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
                              child: CustomTextfield(
                                "Téléphone",
                                FontAwesomeIcons.phoneFlip,
                                TextInputType.phone,
                                phone,
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer votre numéro de téléphone';
                                  }
                                  return null;
                                },
                                (value) {
                                  formKey.currentState?.validate();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
                              child: CustomTextfield(
                                "Addresse",
                                FontAwesomeIcons.mapLocationDot,
                                TextInputType.streetAddress,
                                address,
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer votre adresse';
                                  }
                                  return null;
                                },
                                (value) {
                                  formKey.currentState?.validate();
                                },
                              ),
                            ),
                            Text(
                              "Facture",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: darkColor),
                            ),
                            Row(children: [
                              Checkbox(
                                  value: distribution,
                                  activeColor: greenColor,
                                  onChanged: (newBool) {
                                    setState(() {
                                      distribution = newBool;
                                      if (distribution == true) {
                                        total += distributionPrice;
                                      }
                                    });
                                  }),
                              Text(
                                "Avec réparation",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: darkColor),
                              ),
                            ]),
                            Row(children: [
                              Checkbox(
                                  value: delivery,
                                  activeColor: greenColor,
                                  onChanged: (newBool) {
                                    setState(() {
                                      delivery = newBool;
                                      if (delivery == true) {
                                        total += deliveryPrice;
                                      }
                                    });
                                  }),
                              Text(
                                "Avec livraison",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: darkColor),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: BillText(
                                    "Articles",
                                    total.toDouble().toStringAsFixed(2),
                                    14,
                                    14,
                                    FontWeight.w500)),
                            distribution == true
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: BillText(
                                        "Réparation",
                                        "$distributionPrice",
                                        14,
                                        14,
                                        FontWeight.w500),
                                  )
                                : SizedBox(),
                            delivery == true
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: BillText(
                                        "Livraison",
                                        "$deliveryPrice",
                                        14,
                                        14,
                                        FontWeight.w500),
                                  )
                                : SizedBox(),
                            Divider(
                              color: darkColor,
                              thickness: 2,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: BillText(
                                    "Total",
                                    total.toDouble().toStringAsFixed(2),
                                    28,
                                    18,
                                    FontWeight.bold)),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Buttonwidget(
                                    false, lightColor, redColor, "Annuler", 150,
                                    () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => YesOrNoPopup(
                                        "Alert",
                                        "Etes-vous sûr de vouloir annuler votre achat?",
                                        FontAwesomeIcons.xmark,
                                        redColor, () {
                                      Provider.of<OptionProvider>(context,
                                              listen: false)
                                          .addToCart([]);
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    }),
                                  );
                                }),
                                Buttonwidget(false, lightColor, greenColor,
                                    "Achetez", 150, () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => YesOrNoPopup(
                                          "Alert",
                                          "Etes-vous sûr de vos achats?",
                                          FontAwesomeIcons.check,
                                          greenColor, () {
                                        setState(() {
                                          selectedOptions = [];
                                          userName.clear();
                                          phone.clear();
                                          address.clear();
                                          total = 0;
                                        });
                                        Provider.of<OptionProvider>(context,
                                                listen: false)
                                            .addToCart([]);
                                        Navigator.pushReplacementNamed(
                                            context, Successscreen.routeName);
                                      }),
                                    );
                                  }
                                })
                              ],
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      )
                    ]),
              )),
            )));
  }
}
