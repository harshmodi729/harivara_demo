import 'package:flutter/material.dart';
import 'package:harivara_demo/utils/extension.dart';

import '../utils/app_color.dart';

class SelectBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final VoidCallback onChecked;

  const SelectBox({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(AppColor.appColor),
            value: isChecked,
            onChanged: (bool? value) {
              onChecked();
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          FontWeight.w500.text(text, fontSize: 18),
        ],
      ),
    );
  }
}
