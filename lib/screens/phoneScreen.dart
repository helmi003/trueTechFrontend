import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/components/contentBackAppbar.dart';
import 'package:truetech/components/loadingAnimationComonent.dart';
import 'package:truetech/components/notFoundComponent.dart';
import 'package:truetech/components/phoneComponent.dart';
import 'package:truetech/data/phones.dart';
import 'package:truetech/models/phoneModel.dart';
import 'package:truetech/utils/colors.dart';

class Phonescreen extends StatefulWidget {
  const Phonescreen({super.key});

  @override
  State<Phonescreen> createState() => _PhonescreenState();
}

class _PhonescreenState extends State<Phonescreen> {
  TextEditingController search = TextEditingController();
  List<PhoneModel> phonesData = [];
  List<PhoneModel> filteredData = [];
  bool isLoading = false;
  @override
  void initState() {
    phonesData = phones;
    filteredData = phonesData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: Column(children: [
                ContentBackAppBarWidget("Téléphone", search, (value) {
                  setState(() {
                    if (value.isEmpty) {
                      filteredData = phonesData;
                    } else {
                      filteredData = phonesData
                          .where((phone) =>
                              value.isEmpty ||
                              phone.title
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                          .toList();
                    }
                  });
                },() {
              Navigator.of(context).pop();
            }),
               
                isLoading
                    ? Expanded(child: LoadingAnimationComponent())
                    : filteredData.isEmpty
                        ? Expanded(child: Notfoundcomponent())
                        : Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.all(20.r),
                              itemCount: filteredData.length,
                              itemBuilder: (context, index) {
                                return Phonecomponent(filteredData[index]);
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 30.h,
                                crossAxisSpacing: 30.w,
                              ),
                            ),
                          ),
              ]),
            )));
  }
}
