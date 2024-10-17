import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:ionicons/ionicons.dart";

class tut3 extends StatefulWidget {
  const tut3({key});

  @override
  State<tut3> createState() => _tut3State();
}

class _tut3State extends State<tut3> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 170.0),
                      child: Container(
                       // height: 350,
                        width: 300,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: 
                      Card(
                                                                elevation:0,
                                                                color: Colors.transparent,
                                                                child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      ListTile(title: Text("Your Circleavatar",style: GoogleFonts
                                                                            .montserrat(
                                                                                fontSize: 25,
                                                                                fontWeight:
                                                                                    FontWeight
                                                                                        .bold,
                                                                                color: Colors
                                                                                    .white),),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: MediaQuery.of(context).size.height*.65,
                                                                                      child: SingleChildScrollView(
                                                                                        child: Column(children: [
                                                                                          
                                                                                      
                                                                                                                              ListTile(
                                                                  
                                                                                                                                leading:Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade800,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                          topRight: Radius.circular(20.0),
                                                                                          topLeft: Radius.circular(20.0),
                                                                                          bottomLeft: Radius.circular(20.0),
                                                                                          bottomRight: Radius.circular(20.0))),
                                                                                          child: const Icon(Icons.dark_mode,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Change mode",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Access an easy way to change the theme of your device.",style: GoogleFonts.lexend(
                                                                                                          fontSize: 16,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                  
                                                                                                                              ),
                                                                                                             ListTile(
                                                                  
                                                                                                                                leading:Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade800,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                          topRight: Radius.circular(20.0),
                                                                                          topLeft: Radius.circular(20.0),
                                                                                          bottomLeft: Radius.circular(20.0),
                                                                                          bottomRight: Radius.circular(20.0))),
                                                                                          child: const Icon(Ionicons.bag,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Track orders",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.white,//this is it
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Check out your ordered products.",style: GoogleFonts.lexend(
                                                                                                          fontSize: 16,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                  
                                                                                                                              ),
                                                                    ListTile(
                                                                  
                                                                                                                                leading:Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade800,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                          topRight: Radius.circular(20.0),
                                                                                          topLeft: Radius.circular(20.0),
                                                                                          bottomLeft: Radius.circular(20.0),
                                                                                          bottomRight: Radius.circular(20.0))),
                                                                                          child: const Icon(Ionicons.bicycle,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Track your goods while on transit",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Track your ordered goods seamlessly through our app as it is delivered to you.",style: GoogleFonts.lexend(
                                                                                                          fontSize: 16,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                      
                                                                  
                                                                                                                              ),
                                                                                                                                ListTile(
                                                                  
                                                                                                                                leading:Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade800,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                          topRight: Radius.circular(20.0),
                                                                                          topLeft: Radius.circular(20.0),
                                                                                          bottomLeft: Radius.circular(20.0),
                                                                                          bottomRight: Radius.circular(20.0))),
                                                                                          child: const Icon(Icons.location_pin,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("change delivery address",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Easily change your delivery address when you change location.",style: GoogleFonts.lexend(
                                                                                                          fontSize: 16,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                  
                                                                   ),
                                                                
                                                                
                                                                ],),
                                                                                      ),
                                                                                    )      ],
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
