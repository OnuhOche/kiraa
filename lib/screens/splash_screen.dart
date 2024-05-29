import 'dart:async';


import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:kiraa/screens/home_screen.dart';
import 'package:kiraa/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription userChangeSubscription;

  get user => null;

  @override
  void initState() {
    super.initState();
    startListener();
  }

  void startListener() async {
    await Future.delayed(const Duration(seconds: 4), () {});
     {
      if (user == null) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  void dispose() {
    userChangeSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: RiveAnimation.asset('/'),
          ),
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(milliseconds: 500),
            child: Text('Kira Developers', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}