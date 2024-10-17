import 'package:FreshFit/verifynow/verifynow/clubFpin.dart';
//import 'package:Homecare/verifynow/clubFpin.dart';
import 'package:flutter/material.dart';

class avatar1 extends StatefulWidget {
  const avatar1({
  key,
    required this.color,
    required this.text,
    required this.textcolor,
    required this.username,
    required this.token,
  });

  final Color color;
  final Color textcolor;
  final String text;
  final String username;
  final String token;
  @override
  State<avatar1> createState() => _avatar1State();
}

class _avatar1State extends State<avatar1> {
  xon(String x) {
    var bn = x.substring(0, 1);
    return bn;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(children: [
          circl(
            username: widget.username,
            token: widget.token,
            color: widget.color,
            textcolor: widget.textcolor,
            text: widget.text,
          ),
        ]),
      ),
    );
  }
}
