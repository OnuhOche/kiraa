import 'package:flutter/material.dart';
import 'package:kiraa/components/custom_button.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 38.0),
          //   child: Image.asset('assets/onboarding.jpg'),
          // ),
          CustomButton(
            label: 'Sign In',
            onPressed: () async {


                Navigator.pushReplacementNamed(context, '/home');
              }

          ),
        ],
      ),
    );
  }
}