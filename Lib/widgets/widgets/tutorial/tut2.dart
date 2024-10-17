import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class tut2 extends StatefulWidget {
  const tut2({key});

  @override
  State<tut2> createState() => _tut2State();
}

class _tut2State extends State<tut2> {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 170.0,left:20),
                      
                      child: Container(
                       // height: 400,
                        width: 300,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             
                              ...[
                                "Here's your Notification Center - all your updates in one place"
                                ].map((op) => ListTile(
                                    title: Text(
                                      op.toString(),
                                      style: GoogleFonts.montserrat(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
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
    );
  }
}
