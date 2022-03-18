import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebStatusNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  void change() {
    notifyListeners();
  }
}
