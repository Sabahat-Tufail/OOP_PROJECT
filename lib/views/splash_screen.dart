import 'package:bag_it/views/home_page.dart';
import 'package:bag_it/views/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../network/network.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    checkUser();
    super.initState();
  }

  checkUser() {
    Future.delayed(const Duration(seconds: 2), () async {
      await Network().checkCurrentUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Image.asset('assets/images/on_boarding_delivery.png'),
          SizedBox(height: 20),
          Text(
            'Welcome to "Bag it App"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Get your groceries delivered to your doorstep',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ])));
  }
}
