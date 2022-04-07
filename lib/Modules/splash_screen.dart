import 'package:flutter/material.dart';
import 'package:project/Shared/components/components.dart';
import 'package:project/Modules/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

   AnimationController _controller ;
   Animation <double> _animation;
   @override
  void initState()
  {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.repeat();

    Future.delayed(Duration(seconds:3)).then((value) {
      navigateTo(context,OnBoardingScreen());
    });

    super.initState();
  }
   @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScaleTransition(
        scale: _animation ,
        child: Center(
          child: Image.asset(
            'assets/images/welcome.jpg',
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
