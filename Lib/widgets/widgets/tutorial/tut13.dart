import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:ionicons/ionicons.dart";

class tut13 extends StatefulWidget {
  const tut13({key});

  @override
  State<tut13> createState() => _tut13State();
}

class _tut13State extends State<tut13> {
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
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      ListTile(title: Text("Your cart",style: GoogleFonts
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
                                                                  
                                                                                                                                
                                                                                                                                title: Text("How to order",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Steps:",style: GoogleFonts.lexend(
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
                                                                                          child: const Icon(Icons.add_shopping_cart,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Step 1",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.green,//this is it
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Click on the Shopping cart icon to add items on th cart",style: GoogleFonts.lexend(
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
                                                                                          child: const Icon(Icons.shopping_cart,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("step 2",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("On your cart you can add/remove items then proceed to pay ",style: GoogleFonts.lexend(
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
                                                                                          child: const Icon(Icons.payment,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Step 3",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                         color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Choose your method of payment and just like that your order is on your way ",style: GoogleFonts.lexend(
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
