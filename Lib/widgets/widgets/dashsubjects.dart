
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class dashsubjects extends StatefulWidget {
  dashsubjects({
    key,
    required this.color1,
    required this.color2,
    required this.subjects,
    required this.musername,
    required this.darkmode,
    required this.pics,
    required this.leo,
    required this.HW,
  });
  List<Color> color1;
  List<Color> color2;
  String leo;
  List subjects;
  var darkmode;
  String musername;
  List pics;
  List HW;
  @override
  State<dashsubjects> createState() => _dashsubjectsState();
}

class _dashsubjectsState extends State<dashsubjects> {
  @override
  Widget build(BuildContext context) {
    // var x = widget.subjects.where((t) => t['headline'] != );
    return SingleChildScrollView(
      child: Column(
        children: [
          ...widget.subjects.map((kn) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      /*
                   showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Scaffold(
                            backgroundColor: Colors.transparent,
                            appBar: AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            body: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.0),
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight:
                                            Radius.circular(20.0))),
                                height: 400,
                                width: 350,
                                //         color:Colors.grey.shade900,
                                padding: EdgeInsets.all(20.0),
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Center(
                                        child: Text(
                                          "${kn["headline"]}",
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Card(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: Row(children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                                  ChatScreen(
                                                                    pic_url:
                                                                        widget.pics,
                                                                    mUsername:
                                                                        widget.musername,
                                                                    ouser: kn[
                                                                        "teacher"],
                                                                  )));
                                                },
                                                child: Center(
                                                  child: Container(
                                                    height: 60,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade800,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(
                                                                    20.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                    20.0),
                                                            bottomLeft: Radius
                                                                .circular(
                                                                    20.0),
                                                            bottomRight: Radius
                                                                .circular(
                                                                    20.0))),
                                                    child: Center(
                                                      child: Wrap(
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    "Message teacher",
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight:
                                                                          FontWeight.w500,
                                                                      color:
                                                                          Colors.white,
                                                                      fontSize:
                                                                          17,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ])),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Card(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: Row(children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => gradebook(),
                                  ), //MaterialPageRoute
                                );
                                                },
                                                child: Center(
                                                  child: Container(
                                                    height: 60,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade800,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(
                                                                    20.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                    20.0),
                                                            bottomLeft: Radius
                                                                .circular(
                                                                    20.0),
                                                            bottomRight: Radius
                                                                .circular(
                                                                    20.0))),
                                                    child: Center(
                                                      child: Wrap(
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    "Gradebook",
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight:
                                                                          FontWeight.w500,
                                                                      color:
                                                                          Colors.white,
                                                                      fontSize:
                                                                          17,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ])),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Card(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(
                                                          context);
                                                      /*  Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => fteacher(
                                                   pic_url: widget.pic_url,
                                          username: sky2["username"],
                                          information: widget.information,
                                          token: widget.token,
                                                )));*/
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        height: 60,
                                                        width: 250,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .red
                                                                .shade900
                                                                .withOpacity(
                                                                    0.1),
                                                            borderRadius: BorderRadius.only(
                                                                topRight:
                                                                    Radius.circular(
                                                                        20.0),
                                                                topLeft:
                                                                    Radius.circular(
                                                                        20.0),
                                                                bottomLeft:
                                                                    Radius.circular(
                                                                        20.0),
                                                                bottomRight:
                                                                    Radius.circular(
                                                                        20.0))),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text(
                                                                  "Cancel",
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight:
                                                                        FontWeight.w500,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        17,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ])),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            bottomNavigationBar: Container(
                              height: 150,
                              color: Colors.transparent,
                            ),
                          );
                        });
                 */
                    },
                    child: ListTile(
                        leading: Stack(children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          10.0) //                 <--- border radius here
                                      )),
                              child: Center(
                                  child: Text(kn.toString().substring(0, 1),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: widget.darkmode? Colors.blueGrey.shade100:Colors.grey.shade900)))),
                          Positioned(
                              bottom: 0,
                              right: -2,
                              child: CircleAvatar(
                                radius: 9, //his is the problem!!
                                backgroundColor: widget.darkmode? Colors.blueGrey.shade900:Colors.blueGrey.shade100,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 7,
                                  child: Icon(
                                    Icons.book,
                                    color: Colors.white,
                                    size: 9,
                                  ),
                                ),
                              ))
                        ]),
                        title: Text(kn,
                            style: GoogleFonts.montserrat(
                                fontSize: 22, color: widget.darkmode? Colors.white:Colors.grey.shade900)))),
              )),
        ],
      ),
    );
  }
}
