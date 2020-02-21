import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TestProvider with ChangeNotifier {
  bool _loading = true;

  TestProvider() {
    _loading = false;
    notifyListeners();
  }

  bool get loading => _loading;
}