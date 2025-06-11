import 'package:bonfire/bonfire.dart';
import 'package:bonfire_test/simple_player_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  runApp(const BonfireExamplesApp());
}

class BonfireExamplesApp extends StatelessWidget {
  const BonfireExamplesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const SimplePlayerPage(),
    );
  }
}

class AppColors {
  static const primary = Color(0xffeb6e5a);
  static const background = Color(0xff3f3f3f);
}
