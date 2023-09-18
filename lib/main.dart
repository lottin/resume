import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '';

import 'cv_provider.dart';
import 'displayCV.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cvProvider = CVProvider();
  await cvProvider.initPreferences();
  runApp(
    ChangeNotifierProvider.value(
      value: cvProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cvProvider = Provider.of<CVProvider>(context);
    return MaterialApp(
      title: 'Stage 2',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: MyThemes.darkTheme,
      theme: MyThemes.lightTheme,
      home: DisplayCV(cvProvider: cvProvider),
    );
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.shade50,
    colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.blueGrey),
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.blueGrey,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.blueGrey.shade50,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black54,
    colorScheme: const ColorScheme.dark(
      background: Colors.black54,
    ),
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black54,
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black54,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black54,
      ),
    ),
  );
}