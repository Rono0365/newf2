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
                                                    mainAxisAlignment:        MainAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom:170.0),
                                                            child: Container(
                                                             // height:400,
                                                              width:300,
                                                              padding: const EdgeInsets.all(8.0),
                                                              decoration: BoxDecoration(
                                                                                                              color: Colors.grey.shade900,
                                                                                                              borderRadius:
                                                                                                                  BorderRadius.circular(
                                                              20),
                                                                                                            ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(18.0),
                                                                child: Card(
                                                                  elevation:0,
                                                                  color: Colors.transparent,
                                                                  child: Column(
                                                                    mainAxisAlignment:MainAxisAlignment.center,
                                                                    children: [
                                                                      ListTile(title: Text("Add to your shopping list. This is personal to you; we have no access to it.",style: GoogleFonts
                                                                            .montserrat(
                                                                                fontSize: 25,
                                                                                fontWeight:
                                                                                    FontWeight
                                                                                        .normal,
                                                                                color: Colors
                                                                                    .white),),
                                                                                    ),
                                                                   
                                                                    ],
                                                                  ),
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