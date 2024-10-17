import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:ionicons/ionicons.dart";

class tut12 extends StatefulWidget {
  const tut12({key});

  @override
  State<tut12> createState() => _tut12State();
}

class _tut12State extends State<tut12> {
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
                                                                      ListTile(title: Text("The 'For you' contains",style: GoogleFonts
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
                                                                                          child: const Icon(Icons.shopping_cart,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Quick Reorder",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Streamlined reordering of past purchases",style: GoogleFonts.lexend(
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
                                                                                          child: const Icon(Ionicons.star,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Recommended",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.green,//this is it
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Personalized product suggestions based on purchase history",style: GoogleFonts.lexend(
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
                                                                                          child: const Icon(Ionicons.timer,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Recents",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                          color: Colors.green,
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
                                                                                          child: const Icon(Icons.percent,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Personalised deals",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                         color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Quick access to the best deals",style: GoogleFonts.lexend(
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
                                                                                          child: const Icon(Icons.trending_up,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Trending Items",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                         color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("get to know what people are buying.",style: GoogleFonts.lexend(
                                                                                                          fontSize: 16,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                  
                                                                   ),ListTile(
                                                                  
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
                                                                                          child: const Icon(Icons.eco_outlined,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Sustainability Picks",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                         color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("get items that are fresh and fit for your health",style: GoogleFonts.lexend(
                                                                                                          fontSize: 16,
                                                                                                          color: Colors.white,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                  
                                                                   ),ListTile(
                                                                  
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
                                                                                          child: const Icon(Icons.price_check,color: Colors.green,),
                                                                                                                                ),
                                                                                                                                title: Text("Price Drop Alerts",style: GoogleFonts.montserrat(
                                                                                                          fontSize: 17,
                                                                                                         color: Colors.green,
                                                                                                              //: Colors.black,
                                                                                                        )),
                                                                                                        subtitle:Text("Easily get notified producewhen the price drops",style: GoogleFonts.lexend(
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
