import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metro_ticketing/view/screens/Login/login_screen.dart';
import 'package:metro_ticketing/components/rounded_button.dart';
import 'package:metro_ticketing/view/screens/Signup/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Welcome to\n',
                        style: GoogleFonts.raleway(
                            fontSize: 20,
                            textStyle: const TextStyle(color: Colors.black))),
                    TextSpan(
                        text: 'Metro Ticketing',
                        style: GoogleFonts.raleway(
                            fontSize: 28,
                            textStyle: const TextStyle(color: Colors.black))),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "/icons/chat.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "Login",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "Sign Up",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
