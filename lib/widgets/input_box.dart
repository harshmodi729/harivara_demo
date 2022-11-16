import 'package:flutter/material.dart';
import 'package:harivara_demo/utils/extension.dart';

import 'app_text_field.dart';

class InputBox extends StatelessWidget {
  final String label;
  final TextAlign labelAlign;
  final TextEditingController controller;
  final Function(String value) onValueChanged;

  const InputBox({
    Key? key,
    required this.label,
    this.labelAlign = TextAlign.start,
    required this.controller,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: FontWeight.w600.text(label, textAlign: labelAlign)),
          10.wSpace(),
          AppTextField(
            controller: controller,
            onValueChanged: (String value) {
              onValueChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
