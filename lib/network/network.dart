import 'package:bag_it/views/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/home_page.dart';

class Network{

  FirebaseAuth _auth = FirebaseAuth.instance;


  //check Current user
  Future<User> checkCurrentUser(BuildContext context)async{
    User currentUser = await _auth.currentUser!;
     return currentUser;
  }

  //Register a user
  registerUser(BuildContext context, String email, String password)async{
    UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if(credential.user != null){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("There is an error while authenticating User")));
    }
  }

  //Sign in with Email and Password
signInUser(BuildContext context, String email, String password) async{
    UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);

    if(credential.user != null){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("There is an error while sign in a User") ));

    }
}

}