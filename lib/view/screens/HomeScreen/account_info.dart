// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_ticketing/constants.dart';
import 'package:metro_ticketing/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:metro_ticketing/view/screens/Login/login_screen.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String? lastLogin = "New User";

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      
      setState(() {isLogedIn(loggedInUser.email);});
    });
  }

  Future isLogedIn(String? email) async {
    print(email ?? "1");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    lastLogin = pref.getStringList(email!)![1];
    print(lastLogin ?? "2");
    lastLogin ??= 'New User';
    print(lastLogin ?? "3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Last signin At: '+ lastLogin!),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("/images/batman.jpg"),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "${loggedInUser.firstName} ${loggedInUser.secondName}\n",
                          style: GoogleFonts.londrinaSolid(
                              fontSize: 22,
                              letterSpacing: 2,
                              textStyle: const TextStyle(color: PrimaryColor))),
                      TextSpan(
                          text: " with Email\n",
                          style: GoogleFonts.londrinaSolid(
                              fontSize: 18,
                              textStyle: const TextStyle(color: Colors.black))),
                      TextSpan(
                          text: "${loggedInUser.email}",
                          style: GoogleFonts.londrinaSolid(
                              fontSize: 22,
                              letterSpacing: 2,
                              textStyle: const TextStyle(color: PrimaryColor))),
                      TextSpan(
                          text: "\ncurrently logged in!",
                          style: GoogleFonts.londrinaSolid(
                              fontSize: 18,
                              textStyle: const TextStyle(color: Colors.black))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ActionChip(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    backgroundColor: PrimaryColor,
                    label: Text("Logout",
                        style: GoogleFonts.londrinaSolid(
                            fontSize: 20,
                            letterSpacing: 2,
                            textStyle: const TextStyle(color: Colors.white))),
                    onPressed: () {
                      logout(context);
                    }),
              ],
            )),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/second');
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('user');
  }
}
