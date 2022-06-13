import "package:flutter/material.dart";
import 'package:metro_ticketing/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = PrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: press,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.45,
            height: size.height * 0.075,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: PrimaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    text,
                    style: GoogleFonts.londrinaSolid(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                    ),
                  ),
                )
              ],
            )));
  }
}
