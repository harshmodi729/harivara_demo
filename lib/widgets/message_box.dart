import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harivara_demo/utils/extension.dart';

import '../utils/app_color.dart';

class MessageBox extends StatelessWidget {
  final bool? success;
  final String message;
  final double messageSize;
  final TextAlign messageAlign;

  const MessageBox({
    Key? key,
    required this.success,
    required this.message,
    required this.messageSize,
    required this.messageAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: Get.size.width * 0.6,
      color: success == null
          ? Colors.transparent
          : success!
              ? AppColor.successColor
              : AppColor.errorColor,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: FontWeight.w500.text(
        message,
        fontSize: messageSize,
        color: Colors.white,
        textAlign: messageAlign,
      ),
    );
  }
}
