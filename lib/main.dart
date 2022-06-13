import 'package:metro_ticketing/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metro_ticketing/view/screens/Login/login_screen.dart';
import 'package:metro_ticketing/view/screens/Signup/signup_screen.dart';
import 'package:metro_ticketing/view/screens/Welcome/welcome_screen.dart';
import 'package:metro_ticketing/view/screens/HomeScreen/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC7U_IguNEDMceHM31pvCMII36Il_69kWA", // Your apiKey
      appId: "1:199840663077:android:cf1b7c2f5da7e98519a1cc", // Your appId
      messagingSenderId: "199840663077", // Your messagingSenderId
      projectId: "shuttle-online-3aef0",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Online',
      theme: ThemeData(
        primaryColor: PrimaryColor,
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(primary: PrimaryColor),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const WelcomeScreen(),
        "/second": (context) => const LoginScreen(),
        "/third": (context) => const SignUpScreen(),
        "/fourth": (context) => const BottomNavigation(),
      },
      //  home: const WelcomeScreen(),
    );
  }
}
