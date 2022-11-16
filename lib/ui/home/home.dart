import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harivara_demo/ui/home/home_controller.dart';
import 'package:harivara_demo/utils/app_string.dart';
import 'package:harivara_demo/utils/extension.dart';
import 'package:harivara_demo/widgets/app_list.dart';
import 'package:harivara_demo/widgets/input_box.dart';
import 'package:harivara_demo/widgets/message_box.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.hSpace(),
            InputBox(
              label: AppString.totalBoxesToBeDisplayed,
              controller: homeController.totalBoxesEditingController,
              onValueChanged: (String value) {
                homeController.isValid(generateList: true);
              },
            ),
            20.hSpace(),
            const Divider(
              color: Colors.black,
              thickness: 2,
              height: 2,
            ),
            20.hSpace(),
            InputBox(
              label: AppString.maxSelectionAllowed,
              controller: homeController.maxBoxesEditingController,
              labelAlign: TextAlign.end,
              onValueChanged: (String value) {
                homeController.isValid();
              },
            ),
            10.hSpace(),
            InputBox(
              label: AppString.maxAlphabetSelectionAllowed,
              controller: homeController.maxAlphabetsEditingController,
              labelAlign: TextAlign.end,
              onValueChanged: (String value) {
                homeController.isValid();
              },
            ),
            10.hSpace(),
            InputBox(
              label: AppString.maxNumbersSelectionAllowed,
              controller: homeController.maxNumbersEditingController,
              labelAlign: TextAlign.end,
              onValueChanged: (String value) {
                homeController.isValid();
              },
            ),
            10.hSpace(),
            const Divider(color: Colors.black, thickness: 2, height: 2),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppList(
                    getXId: homeController.alphabetGetXId,
                    stringList: homeController.alphabets,
                    boolList: homeController.alphabetsSelection,
                    onChecked: (index) {
                      homeController.onAlphabetChecked(index);
                    },
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                    width: 2,
                  ),
                  AppList(
                    getXId: homeController.numberGetXId,
                    stringList: homeController.numbers,
                    boolList: homeController.numbersSelection,
                    onChecked: (index) {
                      homeController.onNumberChecked(index);
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 2,
              thickness: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      homeController.reset();
                    },
                    child: Container(
                      height: 80,
                      color: const Color(0xFF994EA1),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: FontWeight.w500.text(
                        AppString.resetValues,
                        fontSize: 16,
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GetBuilder<HomeController>(
                    id: homeController.errorGetXId,
                    builder: (controller) {
                      return MessageBox(
                        success: controller.success,
                        message: homeController.errorMessage,
                        messageSize: controller.success ?? true ? 20 : 14,
                        messageAlign: TextAlign.center,
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
