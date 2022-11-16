import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harivara_demo/utils/app_utils.dart';
import 'package:harivara_demo/utils/extension.dart';

import '../utils/app_color.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int? maxLength;
  final Function(String value) onValueChanged;

  const AppTextField({
    Key? key,
    required this.controller,
    this.textInputType = TextInputType.number,
    this.textInputAction = TextInputAction.done,
    this.maxLength,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: Get.size.width * 0.15,
      child: TextField(
        controller: controller,
        style: FontWeight.w500
            .textStyle(fontColor: AppColor.appColor, fontSize: 14),
        decoration: AppUtils.textFieldInputDecoration(),
        maxLength: maxLength,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        textAlign: TextAlign.center,
        onChanged: (value) {
          onValueChanged(value);
        },
      ),
    );
  }
}
