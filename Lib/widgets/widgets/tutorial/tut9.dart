import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class tut9 extends StatefulWidget {
  const tut9({key});

  @override
  State<tut9> createState() => _tut9State();
}

class _tut9State extends State<tut9> {
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
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        height: 150,
                                                      ),
                                                      Row(
                                                    mainAxisAlignment:        MainAxisAlignment.end,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom:70.0),
                                                            child: Container(
                                                            // height:MediaQuery.of(context).size.height*.48,
                                                              
                                                              width:300,
                                                              padding: const EdgeInsets.all(8.0),
                                                              decoration: BoxDecoration(
                                                                                                              color: Colors.grey.shade900,
                                                                                                              borderRadius:
                                                                                                                  BorderRadius.circular(
                                                              20),
                                                                                                            ),
                                                              child: Card(
                                                                elevation:0,
                                                                color: Colors.transparent,
                                                                child: Column(
                                                                  children: [
                                                                   // const ListTile(title:Text("xh")),
                                                                    Text(
                                                                      'Have a direct conversion with the admin.note: the admin changes with region and location',
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