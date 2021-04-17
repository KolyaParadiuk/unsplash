import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/widgets.dart';
import 'package:unsplash/services/api.dart';

class ApiState extends ChangeNotifier {
  ApiService _api = ApiService('', '');
  set api(
    ApiService api,
  ) {
    _api = api;
    notifyListeners();
  }

  ApiService get api => _api;
}

ApiState useApi() => Provider.of<ApiState>(useContext());
