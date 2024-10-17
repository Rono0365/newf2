import "package:FreshFit/verifynow/verifynow/verifysmall.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

//import "../verifynow/verifysmall.dart";

class replywidget extends StatefulWidget {
  const replywidget({
    key,
    required this.name,
    //  required this.postdata,
    required this.id,
    required this.text,
    required this.title, //replied club title
    required this.token,
    required this.image,
    required this.time,
    required this.ouser,
  });
  final String name;
  final String time;
  final String ouser;
  final List image;
  //final List postdata;
  final String text;

  final String token;
  final String title;
  final int id;

  @override
  State<replywidget> createState() => _replywidgetState();
}

class _replywidgetState extends State<replywidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade800.withOpacity(0.2),
      ),
      //padding:EdgeInsets.only(left: 15),
      width: MediaQuery.of(context).size.width * .88,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .85,
                  child: Text("“${widget.text}”".replaceAll("[", ""),
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Colors.grey))),
            ],
          ),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 19,
                          backgroundColor: Colors.transparent,
                          child: Center(
                            child:
                                Text(widget.ouser.toString().substring(0, 1)),
                          ),
                        ),
                      ),
                      ...widget.image
                          .where(
                              (c) => c['username1'] == widget.ouser.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.transparent,
                              //backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius: 19,
                                backgroundColor: Colors.transparent,

                                backgroundImage: NetworkImage(
                                  ui['image'].replaceAll(" ", ''),
                                ), //ui['image'],
                              ),
                            ),
                          ),
                    ]),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .56,
                        child: Row(
                          children: [
                            verifysmall(
                                username: widget.ouser, token: widget.token),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .56,
                        child: Row(
                          children: [
                            Text(
                                widget.time.toString().replaceAll("|", " at "),
                                style: const TextStyle(color: Colors.grey))
                            // getime(ret:.replaceAll(" ","")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
