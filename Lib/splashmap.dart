import 'package:FreshFit/transit1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'login.dart';
import 'package:lottie/lottie.dart';

class screenmap extends StatefulWidget {
   const screenmap({Key? key,required this.mode}) : super(key: key);

   final bool mode;

  @override
  _screenmapState createState() => _screenmapState();
}

class _screenmapState extends State<screenmap> {
  @override
  void initState() {
    super.initState();
    _navtohome();
  }

  _navtohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MapScreen(
          darkmode:widget.mode,
        )));//MyHomePage(title: "myRiara")
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.mode?Colors.grey.shade900:Colors.grey.shade50,
      body: Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height*.4,
                    width: MediaQuery.of(context).size.width*.4,
                    child: 
                      Lottie.asset('assets/delivery.json'),
                
                     )
              ),
      );
  }
}

         
           