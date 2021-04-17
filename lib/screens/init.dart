import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:unsplash/hooks/navigation.dart';
import 'package:unsplash/screens/ImageaFeedScreen.dart';
import 'package:unsplash/services/api.dart';
import 'package:unsplash/states/api.dart';

class InitScreen extends HookWidget {
  static const navigationKey = "init";

  @override
  Widget build(BuildContext context) {
    var apiState = useApi();
    var navigator = useNavigation();
    useEffect(() {
      var init = () async {
        await load(fileName: ".env");
        apiState.api = ApiService(env['API_URL'], env['ACCESS_KEY']);
        navigator.pushReplacementNamed(ImageFeedScreen.navigationKey);
      };
      init();
      return null;
    }, []);
    return (Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
