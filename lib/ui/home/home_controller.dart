import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harivara_demo/utils/app_string.dart';

class HomeController extends GetxController {
  final TextEditingController totalBoxesEditingController =
      TextEditingController();
  final TextEditingController maxBoxesEditingController =
      TextEditingController();
  final TextEditingController maxAlphabetsEditingController =
      TextEditingController();
  final TextEditingController maxNumbersEditingController =
      TextEditingController();
  List<String> alphabets = [];
  List<bool> alphabetsSelection = [];
  List<String> numbers = [];
  List<bool> numbersSelection = [];
  String _initAlphabet = 'A';
  final int _alphabetLimit = 26;
  int totalSelectedBox = 0;
  bool? success;
  String errorMessage = '';

  /// Below Strings are used for update the list selection and success/error messages
  String alphabetGetXId = 'alphabetGetXId';
  String numberGetXId = 'numberGetXId';
  String errorGetXId = 'errorGetXId';

  /// Will Generate list based on number given in total box field(1st TextField)
  void _generateList() {
    /// Clear all list and add data again
    alphabets.clear();
    alphabetsSelection.clear();
    numbers.clear();
    numbersSelection.clear();

    int j = 0;
    /// Get ASCII code of the alphabet
    int code = _initAlphabet.codeUnitAt(0);
    for (int i = 0; i < int.parse(totalBoxesEditingController.text); i++) {
      /// If total boxes limit goes above Z then it will re-start A
      if (j == _alphabetLimit) {
        _initAlphabet = 'A';
        code = _initAlphabet.codeUnitAt(0);
      }
      /// Get String value from the ASCII code
      String s = String.fromCharCode(code);
      alphabets.add(s);
      alphabetsSelection.add(false);
      j++;
      code++;

      numbers.add('${i + 1}');
      numbersSelection.add(false);
    }
    update([alphabetGetXId, numberGetXId]);
  }

  /// Triggered when any Alphabet box is selected and check the conditions and shows
  /// message in bottom space
  void onAlphabetChecked(int index) {
    int totalSelectedAlphabet = _totalSelectedAlphabet();
    if (alphabetsSelection[index]) {
      alphabetsSelection[index] = !alphabetsSelection[index];
      update([alphabetGetXId]);
      return;
    }
    if (int.parse(maxAlphabetsEditingController.text) > totalSelectedAlphabet &&
        totalSelectedAlphabet + _totalSelectedNumbers() <
            int.parse(maxBoxesEditingController.text)) {
      alphabetsSelection[index] = !alphabetsSelection[index];
      success = true;
      errorMessage = AppString.success;
      update([alphabetGetXId, errorGetXId]);
    } else {
      success = false;
      if (totalSelectedAlphabet + _totalSelectedNumbers() ==
          int.parse(maxBoxesEditingController.text)) {
        errorMessage =
            '${AppString.errorMaxSelection} ( ${maxBoxesEditingController.text} )';
      } else {
        errorMessage =
            '${AppString.errorMaxAlphabet} ( ${maxAlphabetsEditingController.text} )';
      }
      update([errorGetXId]);
    }
  }

  /// Triggered when any Number box is selected and check the conditions and shows
  /// message in bottom space
  void onNumberChecked(int index) {
    int totalSelectedNumber = _totalSelectedNumbers();
    if (numbersSelection[index]) {
      numbersSelection[index] = !numbersSelection[index];
      update([numberGetXId]);
      return;
    }
    if (int.parse(maxNumbersEditingController.text) > totalSelectedNumber &&
        totalSelectedNumber + _totalSelectedAlphabet() <
            int.parse(maxBoxesEditingController.text)) {
      numbersSelection[index] = !numbersSelection[index];
      success = true;
      errorMessage = AppString.success;
      update([numberGetXId, errorGetXId]);
    } else {
      success = false;
      if (totalSelectedNumber + _totalSelectedAlphabet() ==
          int.parse(maxBoxesEditingController.text)) {
        errorMessage =
            '${AppString.errorMaxSelection} ( ${maxBoxesEditingController.text} )';
      } else {
        errorMessage =
            '${AppString.errorMaxNumber} ( ${maxNumbersEditingController.text} )';
      }
      update([errorGetXId]);
    }
  }

  /// Count total number of boxes are selected in Alphabet list
  int _totalSelectedAlphabet() {
    int cnt = 0;
    for (var e in alphabetsSelection) {
      if (e) {
        cnt++;
      }
    }
    return cnt;
  }

  /// Count total number of boxes are selected in Number list
  int _totalSelectedNumbers() {
    int cnt = 0;
    for (var e in numbersSelection) {
      if (e) {
        cnt++;
      }
    }
    return cnt;
  }

  /// Will check if given input is valid or not and shows error in bottom space
  bool isValid({bool generateList = false}) {
    if (maxBoxesEditingController.text.isNotEmpty &&
        totalBoxesEditingController.text.isNotEmpty &&
        int.parse(maxBoxesEditingController.text) >
            int.parse(totalBoxesEditingController.text) * 2) {
      success = false;
      errorMessage = AppString.errorWrongMaxSelectionInput
          .replaceAll('[count]', totalBoxesEditingController.text);
      update([errorGetXId]);
      return false;
    }
    if (maxAlphabetsEditingController.text.isNotEmpty &&
        totalBoxesEditingController.text.isNotEmpty &&
        int.parse(maxAlphabetsEditingController.text) >
            int.parse(totalBoxesEditingController.text)) {
      success = false;
      errorMessage = AppString.errorWrongAlphabetSelectionInput
          .replaceAll('[count]', totalBoxesEditingController.text);
      update([errorGetXId]);
      return false;
    }
    if (maxNumbersEditingController.text.isNotEmpty &&
        totalBoxesEditingController.text.isNotEmpty &&
        int.parse(maxNumbersEditingController.text) >
            int.parse(totalBoxesEditingController.text)) {
      success = false;
      errorMessage = AppString.errorWrongNumberSelectionInput
          .replaceAll('[count]', totalBoxesEditingController.text);
      update([errorGetXId]);
      return false;
    }
    success = null;
    errorMessage = '';
    update([errorGetXId]);
    if (generateList) {
      _generateList();
    }
    return true;
  }

  /// Will reset all fields and list
  void reset() {
    success = null;
    errorMessage = '';
    alphabets.clear();
    numbers.clear();
    alphabetsSelection.clear();
    numbersSelection.clear();
    totalBoxesEditingController.clear();
    maxBoxesEditingController.clear();
    maxAlphabetsEditingController.clear();
    maxNumbersEditingController.clear();
    update([alphabetGetXId, numberGetXId, errorGetXId]);
  }
}
