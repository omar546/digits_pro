import 'package:flutter/services.dart';

class KeyboardUtils {
  static Type hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Future;
  }
}
