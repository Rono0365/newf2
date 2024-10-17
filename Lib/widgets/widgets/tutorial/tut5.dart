import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class tut5 extends StatefulWidget {
  const tut5({key});

  @override
  State<tut5> createState() => _tut5State();
}

class _tut5State extends State<tut5> {
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
                                                                   
                                                            ...["""Tap your profile circle to update your picture.""",

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