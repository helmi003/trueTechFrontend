// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetech/components/contentBackAppbar.dart';
import 'package:truetech/components/loadingAnimationComonent.dart';
import 'package:truetech/components/notFoundComponent.dart';
import 'package:truetech/components/versionComponentModel.dart';
import 'package:truetech/data/versions.dart';
import 'package:truetech/models/phoneModel.dart';
import 'package:truetech/models/versionModel.dart';
import 'package:truetech/utils/colors.dart';

class VersionScreen extends StatefulWidget {
  final PhoneModel phone;
  VersionScreen(this.phone);

  @override
  State<VersionScreen> createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  TextEditingController search = TextEditingController();
  List<VersionModel> verionsData = [];
  List<VersionModel> filteredData = [];
  bool isLoading = false;
  @override
  void initState() {
    verionsData = versions;
    filteredData = verionsData;
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
                ContentBackAppBarWidget(widget.phone.title, search, (value) {
                  setState(() {
                    if (value.isEmpty) {
                      filteredData = verionsData;
                    } else {
                      filteredData = verionsData
                          .where((phone) =>
                              value.isEmpty ||
                              phone.title
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                          .toList();
                    }
                  });
                }, () {
                  Navigator.of(context).pop();
                }),
                isLoading
                    ? Expanded(child: LoadingAnimationComponent())
                    : filteredData.isEmpty
                        ? Expanded(child: Notfoundcomponent())
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              itemCount: filteredData.length,
                              itemBuilder: (context, index) {
                                return VersionComponent(filteredData[index]);
                              },
                            ),
                          ),
              ]),
            )));
  }
}
