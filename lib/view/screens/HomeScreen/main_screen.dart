import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metro_ticketing/constants.dart';
import 'package:metro_ticketing/view/screens/HomeScreen/account_info.dart';
import 'package:metro_ticketing/view/screens/HomeScreen/home_screen.dart';
import 'package:metro_ticketing/view/screens/HomeScreen/route_detail.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:metro_ticketing/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metro_ticketing/view/screens/HomeScreen/drawer_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();
  // late StreamSubscription<User?> user;

  // @override
  // void initState() {
  //   super.initState();
  //   // FirebaseFirestore.instance
  //   //     .collection("users")
  //   //     .doc(user!.uid)
  //   //     .get()
  //   //     .then((value) {
  //   //   loggedInUser = UserModel.fromMap(value.data());
  //   //   setState(() {});
  //   // });
  //   user = FirebaseAuth.instance.authStateChanges().listen((user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  // }

  int _activePage = 0;

  final List<Widget> _tabItems = [
    const HomeScreen(),
    const RouteDetail(),
    const DrawerPage(),
    const AccountInfo(),
  ];

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          SizedBox(
              height: 50,
              child: Column(
                  children: const [Icon(Icons.home, size: 25), Text("Home")])),
          SizedBox(
              height: 50,
              child: Column(children: const [
                Icon(Icons.description_rounded, size: 25),
                Text("Tickets")
              ])),
          SizedBox(
              height: 50,
              child: Column(children: const [
                Icon(Icons.message, size: 25),
                Text("Contact")
              ])),
          SizedBox(
              height: 50,
              child: Column(children: const [
                Icon(Icons.account_box_rounded, size: 25),
                Text("Account")
              ])),
        ],
        color: PrimaryLightColor,
        buttonBackgroundColor: PrimaryLightColor,
        backgroundColor: Colors.grey,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _tabItems[_activePage],
    );
  }
}
