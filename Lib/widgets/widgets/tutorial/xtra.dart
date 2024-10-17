import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class tut8 extends StatefulWidget {
  const tut8({key});

  @override
  State<tut8> createState() => _tut8State();
}

class _tut8State extends State<tut8> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height
                                                      ,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                    mainAxisAlignment:        MainAxisAlignment.end,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom:70.0),
                                                            child: Container(
                                                             height:MediaQuery.of(context).size.height*.55,
                                                              
                                                              width:300,
                                                              padding: const EdgeInsets.all(8.0),
                                                              decoration: BoxDecoration(
                                                                                                              color: Colors.grey.shade800,
                                                                                                              borderRadius:
                                                                                                                  BorderRadius.circular(
                                                              20),
                                                                                                            ),
                                                              child: Card(
                                                                elevation:0,
                                                                color: Colors.transparent,
                                                                child: Column(
                                                                  children: [
                                                                    const ListTile(title:Text("xh")),
                                                                    Text(
                                                                      'notification ',
                                                                      style: GoogleFonts
                                                                          .montserrat(
                                                                              fontSize: 22,
                                                                              fontWeight:
                                                                                  FontWeight
                                                                                      .w400,
                                                                              color: Colors
                                                                                  .white),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
  }
}