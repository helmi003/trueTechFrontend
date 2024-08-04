import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:truetech/components/contentBackAppbar.dart';
import 'package:truetech/components/loadingAnimationComonent.dart';
import 'package:truetech/components/notFoundComponent.dart';
import 'package:truetech/components/optionComponent.dart';
import 'package:truetech/components/selectedOptions.dart';
import 'package:truetech/data/options.dart';
import 'package:truetech/models/optionModel.dart';
import 'package:truetech/models/selectedOptionModel.dart';
import 'package:truetech/models/versionModel.dart';
import 'package:truetech/screens/billScreen.dart';
import 'package:truetech/services/optionProvider.dart';
import 'package:truetech/utils/colors.dart';

class Optionscreen extends StatefulWidget {
  final VersionModel version;
  Optionscreen(this.version);

  @override
  State<Optionscreen> createState() => _OptionscreenState();
}

class _OptionscreenState extends State<Optionscreen> with RouteAware {
  TextEditingController search = TextEditingController();
  List<SelectedOptionModel> selectedOptions = [];
  List<OptionModel> optionsData = [];
  List<OptionModel> filteredData = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    optionsData = options;
    filteredData = optionsData;
    _loadSelectedOptions();
  }

  void _loadSelectedOptions() {
    selectedOptions =
        Provider.of<OptionProvider>(context, listen: false).selectedOptions;
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
        }
      }
    });
  }

  num getOptionQuantity(OptionModel option) {
    var existingOption = selectedOptions.firstWhere(
      (opt) => opt.option == option,
      orElse: () => SelectedOptionModel(
        option: OptionModel(
          id: 0,
          title: '',
          model: '',
          type: '',
          prix: 0,
          image: '',
        ),
        quantity: 0,
      ),
    );
    return existingOption.quantity;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSelectedOptions();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // Refresh the state when coming back to this screen
    _loadSelectedOptions();
  }

  @override
  Widget build(BuildContext context) {
    selectedOptions = Provider.of<OptionProvider>(context).selectedOptions;
    return Scaffold(
      backgroundColor: bgColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Column(
            children: [
              ContentBackAppBarWidget(widget.version.title, search, (value) {
                setState(() {
                  if (value.isEmpty) {
                    filteredData = optionsData;
                  } else {
                    filteredData = optionsData
                        .where((phone) => phone.title
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  }
                });
              }, () {
                Provider.of<OptionProvider>(context, listen: false)
                    .addToCart([]);
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
                              return OptionComponent(
                                filteredData[index],
                                getOptionQuantity(filteredData[index]),
                                () => _incrementOption(filteredData[index]),
                                () => _decrementOption(filteredData[index]),
                              );
                            },
                          ),
                        ),
              Visibility(
                visible: selectedOptions.isNotEmpty,
                child: SizedBox(
                  height: 110.h,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: selectedOptions.isNotEmpty
          ? SizedBox(
              height: 110.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(13, 15, 13, 5),
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedOptions.length,
                      itemBuilder: (context, index) =>
                          SelectedOptions(selectedOptions[index], () {
                        setState(() {
                          selectedOptions.removeAt(index);
                        });
                      }),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<OptionProvider>(context, listen: false)
                          .addToCart(selectedOptions);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillScreen(),
                          ));
                    },
                    child: Container(
                      width: 110.h,
                      height: 110.h,
                      decoration: BoxDecoration(color: lightPurpleColor),
                      child: Center(
                        child: Icon(FontAwesomeIcons.cartArrowDown,
                            size: 46.sp, color: lightColor),
                      ),
                    ),
                  )
                ],
              ),
            )
          : null,
    );
  }
}
