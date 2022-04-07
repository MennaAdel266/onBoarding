import 'package:flutter/material.dart';
import 'package:project/Modules/login_screen.dart';
import 'package:project/Modules/onboarding_screen.dart';
import 'package:project/Modules/splash_screen.dart';
import 'package:project/Shared/shared_preferences.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  if( onBoarding != null)
  {
     var widget = LoginScreen();
  } else
  {
    var widget = OnBoardingScreen();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


