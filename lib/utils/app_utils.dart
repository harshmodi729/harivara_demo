import 'package:flutter/material.dart';

import 'app_color.dart';

class AppUtils {
  AppUtils._();

  static InputDecoration textFieldInputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.textFieldBorderColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.textFieldBorderColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.textFieldBorderColor)),
      counterText: '',
      hintText: '0',
    );
  }
}
