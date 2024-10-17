import "dart:convert";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class verifyprofile extends StatefulWidget {
  const verifyprofile({
    key,
    required this.username,
    required this.token,
    required this.darkmode
  });
  final String username;
  final bool darkmode;
  final String token;

  @override
  State<verifyprofile> createState() => _verifyprofileState();
}

class _verifyprofileState extends State<verifyprofile> {
  var verifiedx = [];
  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed4 = jsonDecode(sharedPreferences.getString('verifiedx')!);

    setState(() {
      verifiedx = passed4;
    });
  }

  Future inm() async {
    //inm(sky2,pic_url, information,);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('verifiedx', json.encode(verifiedx));
  }

  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };

    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('verified', json.encode(verified1));

    setState(() {
      verifiedx = verified1;
    });
    //inm();
    //print(verifiedx);
  }

  @override
  void initState() {
    super.initState();
    //getValidation();
    //inmat(); reason not that important for now
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 170,
                  child: Text(
                    widget.username.toString(),
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:widget.darkmode? Colors.white:Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
