import 'package:flutter/cupertino.dart';
import 'package:restaurants/app.dart';

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  registerSingletons();

  runApp(App());
}
