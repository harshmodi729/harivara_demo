import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/home/home_controller.dart';
import 'select_box.dart';

class AppList extends StatelessWidget {
  final String getXId;
  final List<String> stringList;
  final List<bool> boolList;
  final Function(int index) onChecked;

  const AppList({
    Key? key,
    required this.getXId,
    required this.stringList,
    required this.boolList,
    required this.onChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: GetBuilder<HomeController>(
            id: getXId,
            builder: (controller) {
              return Column(
                children: List.generate(
                  stringList.length,
                  (index) => SelectBox(
                    text: stringList[index],
                    isChecked: boolList[index],
                    onChecked: () {
                      onChecked(index);
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
