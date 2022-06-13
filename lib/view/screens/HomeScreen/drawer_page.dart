// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:metro_ticketing/components/rounded_button.dart';
import 'package:metro_ticketing/constants.dart';
import 'contact.dart';
import 'package:metro_ticketing/controller/message_controller.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  static const route = "/drawer";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(color: PrimaryLightColor, boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                "In case of questions,\ncomments, concerns or \ncompliments, please\nfeel free to tell us!!",
                            style: GoogleFonts.londrinaSolid(
                                fontSize: 20,
                                letterSpacing: 1,
                                textStyle:
                                    const TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          RoundedButton(
            text: "Contact Us",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ChangeNotifierProvider(
                    create: (context) => MessageController(),
                    child: Contact(),
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
