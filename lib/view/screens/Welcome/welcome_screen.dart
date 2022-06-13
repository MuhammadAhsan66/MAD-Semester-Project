import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metro_ticketing/view/screens/Welcome/components/body.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const route = "/welcome";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late StreamSubscription<User?> user;
  
  @override
  void initState(){
    super.initState();

   user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Navigator.of(context).pushReplacementNamed('/fourth');
      }
    });


    // isLogedIn();
  }



  // Future isLogedIn() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var email = pref.getString('email');
  //   if(email != null){
  //     Navigator.of(context).pushReplacementNamed('/fourth');
  //   }
  //   print(email);
  // }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
