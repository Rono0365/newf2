import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class tut1 extends StatefulWidget {
  const tut1({key});

  @override
  State<tut1> createState() => _tut1State();
}

class _tut1State extends State<tut1> {
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
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height: 60,),
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
                                                                      ListTile(title: Text("Find anything instantly with our powerful search",style: GoogleFonts
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