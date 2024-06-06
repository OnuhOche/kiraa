
import 'package:flutter/material.dart';
import 'package:kiraa/screens/home_screen.dart';
import 'package:kiraa/screens/login_screen.dart';
import 'package:kiraa/screens/splash_screen.dart';
import 'package:kiraa/screens/video_call_screen.dart';

// Future<void> main() async {
//
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kiraa',
        // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          "/login": (context) => const LoginScreen(),
          "/home": (context) => const HomeScreen(),
          "/video-call": (context) => const VideoCallScreen(),
        },
        // initialRoute: SplashScreen.routeName,
        home: const HomeScreen());
  }
}