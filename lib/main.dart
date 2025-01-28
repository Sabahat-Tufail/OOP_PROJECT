import 'package:bag_it/view_model/auth_view_model.dart';
import 'package:bag_it/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bag_it/model/cart_model.dart';
import 'package:bag_it/model/favorite_model.dart';
import 'package:bag_it/views/onboarding.dart';
import 'package:bag_it/views/signin.dart';
import 'package:bag_it/views/signup.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AuthViewModel()),
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            SplashScreen(), // Initial screen, you can switch to favorite page as needed
      ),
    );
  }
}
