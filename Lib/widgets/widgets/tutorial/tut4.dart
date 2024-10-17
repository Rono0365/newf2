import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class tut4 extends StatefulWidget {
  const tut4({key});

  @override
  State<tut4> createState() => _tut4State();
}

class _tut4State extends State<tut4> {
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
                                                      //ListTile()
                                                      SizedBox(
                                                        height: 110,
                                                      ),
                                                      Row(
                                                    mainAxisAlignment:        MainAxisAlignment.end,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom:170.0),
                                                            child: Container(
                                                             // height:MediaQuery.of(context).size.height*.8,
                                                              width:MediaQuery.of(context).size.width*.9,
                                                              padding: const EdgeInsets.all(8.0),
                                                              decoration: BoxDecoration(
                                                                                                              color: Colors.grey.shade900,
                                                                                                              borderRadius:
                                                                                                                  BorderRadius.circular(
                                                              20),
                                                                                                            ),
                                                              child:
                                                              
                                                               Card(
                                                                elevation:0,
                                                                color: Colors.transparent,
                                                                child: Column(
                                                                  children: [
                                                                   
                                                            ...["""By Scrolling horizontally you can browse through groceries by category - find what you need fast!""",

    ].map((op)=>        ListTile(
      title:        Text(
                                                                       op.toString(),
                                                                          style: GoogleFonts
                                                                              .montserrat(
                                                                                  fontSize: 22,
                                                                                  fontWeight:
                                                                                      FontWeight
                                                                                          .w400,
                                                                                  color: Colors
                                                                                      .white),
                                                                        ),
      
    )),
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
                                          );}
}