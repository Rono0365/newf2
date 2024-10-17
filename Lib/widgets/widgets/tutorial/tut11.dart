import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class tut11 extends StatefulWidget {
  const tut11({key});

  @override
  State<tut11> createState() => _tut11State();
}

class _tut11State extends State<tut11> {
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
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                    mainAxisAlignment:        MainAxisAlignment.end,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom:70.0),
                                                            child: Container(
                                                            // height:MediaQuery.of(context).size.height*.35,
                                                              
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
                                                                  //  const ListTile(title:Text("xh")),
                                                                    Text(
                                                                      'get to turn off the sales,deals,offers & promos alert from your for You page',
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