import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sks_ticket_view/sks_ticket_view.dart';
class traktar extends StatelessWidget {
  const traktar(
      {Key? key,
      required this.title,
      required this.title1,
      required this.darkmode,
      required this.text1,
      required this.scaffold1})
      : super(key: key);
  final List title;
  final String title1;
  final bool darkmode;
  final Color text1;
  final Color scaffold1;
  @override
  Widget build(BuildContext context) {
    List ttkes = [];
    List list_price = [];
    //var total => title[1].fold(0, (e, t) => e + t);
    print(title1.toString());
    //final xc =Todo;
    //ttkes.add((int.parse(i['price'])*int.parse(title2)));
    return Scaffold(
      backgroundColor: darkmode?Colors.grey.shade900:Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: darkmode?Colors.grey.shade900:Colors.grey.shade100,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: !darkmode?Colors.grey.shade900:Colors.grey.shade100,)),
        title: Row(children: [
          Text("History",
            style: GoogleFonts.lato(
                    fontSize: 19,
                    color: !darkmode?Colors.grey.shade900:Colors.grey.shade100
                   // fontWeight: FontWeight.bold,
                  ),),
          InkWell(
              child: Tab(
                  //onPressed:(){},
                  /*icon:CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      
                                      child: CircleAvatar(
                                        child: Icon(Icons.store,
                                          color: Colors.green),
                                          backgroundColor: Colors.white,
                                      
                                    )),*/
                  child: Text(
            "",
            style: TextStyle(color: Colors.black),
          ))),
        ]),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...title.reversed
                .where((op) => op['owner'].toString() == title1.toString())
                .map((i)
                        //var index = sky.indexOf(i);
                        =>
                        i['owner'].toString() != title1.toString()
                            ? Container()
                            : SKSTicketView(
           backgroundPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      backgroundColor: Colors.green,
      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      triangleAxis: Axis.vertical,
      borderRadius: 2,
      drawDivider: false,
      trianglePos: .5,
      //circleDash: true,
      drawArc: true,
      //dividerPadding: 2,
      //dividerColor: Color(0xFF8F1299),
      dashWidth: 3,
          child: SizedBox(
                   //               elevation: 0.9,
                                  child: Column(children: [
                                    
                                    ListTile(
                                      title: Text("#"+i['id'].toString(),
                                          style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24)),
                                      //leading: Text(i['time'].toString(),style:TextStyle(color:Colors.black)),
                                      subtitle: Text("You Ordered:",style:GoogleFonts.ibmPlexMono(
                   // fontSize: 24,
                   // fontWeight: FontWeight.bold,
                  )),
                                     trailing: Icon(Ionicons.open_outline,color: Colors.black,),                 
                              
                                      //title: Text('name',style:TextStyle(color:Colors.black)),
                                    ),
                                    ...i['food']
                                        .replaceAll("],", "|")
                                        .replaceAll("[", "")
                                        .replaceAll("]]", "")
                                        .split("|")
                                        .map((k) => ListTile(
                                                title: Column(
                                              children: [
                                                Card(
                                                    elevation: 0,
                                                    color:  Colors.white12
                                                        ,
                                                    child: Container(
                                                     
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                child: Card(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 0,
                                                                  child: Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              80,
                                                                          width:
                                                                              79,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            //color:Colors.green,
                                                                            borderRadius: BorderRadius.all(
                                                                                Radius.circular(10.0) //                 <--- border radius here
                                                                                ),
                                                                            image:
                                                                                DecorationImage(
                                                                              image:
                                                                                  NetworkImage("${k.split(",")[1].toString().replaceAll(" ", "")}")
                                                                              //k.split(",")[1],                                                                         ),
                                                                              ,
                                                                              fit:
                                                                                  BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              null,
                                                                        )
                                                                      ]),
                                                                ),
                                                              ),
                                                              Container(
                                                                  width: 230,
                                                                  child: ListTile(
                                                                    title:
                                                                        Text(
                                                                     "${k.split(
                                                                          ",")[0]}",
                                                                      style: GoogleFonts.lato(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
                                                                    ),
                                                                    subtitle: Text(k.split(",")[2].toString(),style: GoogleFonts.ibmPlexMono(
                  //  fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
                                                                   trailing: Text(
                                                                      k.split(
                                                                          ",")[3].toString(),style: GoogleFonts.ibmPlexMono(
                    fontSize: 12,
                   // fontWeight: FontWeight.bold,
                    color: Colors.green,
                  )
                                                                    ),
                                                                    /* subtitle: Wrap(
                                                                                                                                    children: [
                                                                                                                                      Text((int.parse(k.split(",")[3].toString()) * quantity).toString() + 'KES' : k.split(",")[3].toString() + 'KES',
                                                                                                                                          style: TextStyle(
                                                                                                                                              /*backgroundColor: Colors
                                                                      .red
                                                                      .withOpacity(
                                                                          0.1),*/
                                                                                                                                              color: Colors.green)),
                                                                                                                                      Text(" ", style: TextStyle(color: text1)),
                                                                                                
                                                                                                                                      /* Text( ii == i['name']
                                                                    ? (int.parse(i['points']) *
                                                                                quantity)
                                                                            .toString(): i['points']
                                                                            .toString() 
                                                                        ,style: TextStyle(
                                                                          color: darkmode?Colors.amber.shade200:Colors.amber.shade900
                                                                        ),),
                                                                        Icon(Icons.diamond,color:icon1,size:17),*/
                                                                                                                                    ],
                                                                                                                                  ),*/
                                                                  )),
                                                             ]),
                                                      ),
                                                    )
                              
                                                    //end
                                                    )
                                                /* ListTile(
                                                                                 leading: 
                                                                                  CircleAvatar(
                                                                                    backgroundColor: Colors.transparent,
                                                radius: 35,
                                                backgroundImage: NetworkImage(
                                                  k.split(",")[1].toString()
                                                ), //AtImage(i['image'],),
                                              ),
                                                                                
                                                                                 title: Text(k.split(",")[1].toString()),
                                                                               ),*/
                              
                                                //  ...food7.map((lo)=>//Text(lo['name'].toString())
                                                // lo['name'] ==k.split(",")[0].toString()?  Text(k.split(",")[0].toString()):SizedBox())
                                                //
                                                ,
                                                SizedBox(height: 10),
                                                Container(
                                                    height: 0.07,
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .8,
                                                    color: Colors.grey.shade900),
                                                SizedBox(height: 10),
                                              ],
                                            )
                                                //Text(k.split(",")[0].toString()),
                              
                                                )),
                              ListTile(
                                      //leading: Text(i['time'].toString(),style:TextStyle(color:Colors.black)),
                                      subtitle: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Method of Payment",style: GoogleFonts.inconsolata(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                                 // fontSize: 24,
                                                               //  fontWeight: FontWeight.bold,
                                                                ),),
                                                                Text("M-pesa",style: GoogleFonts.inconsolata(
                                                                 // fontSize: 24,
                                                               //  fontWeight: FontWeight.bold,
                                                                ),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Time",style: GoogleFonts.inconsolata(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                                 // fontSize: 24,
                                                               //  fontWeight: FontWeight.bold,
                                                                ),),
                                                                Text(i['time'].toString().split(",")[1].toString(),style: GoogleFonts.inconsolata(
                                                                 // fontSize: 24,
                                                               //  fontWeight: FontWeight.bold,
                                                                ),)
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Delivery",style: GoogleFonts.inconsolata(
                                                color: Colors.black,
                                                                 // fontSize: 24,
                                                                fontWeight: FontWeight.w600,
                                                                ),),
                                                                Text("Delivered",style: GoogleFonts.inconsolata(
                                                                 // fontSize: 24,
                                                               //  fontWeight: FontWeight.bold,
                                                                ),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("VAT",style: GoogleFonts.inconsolata(
                                                fontWeight: FontWeight.w600,
                                                                 // fontSize: 24,
                                                               //  fontWeight: FontWeight.bold,
                                                                ),),
                                                                Text("16%",style: GoogleFonts.inconsolata(
                                                                 // fontSize: 24,
                                                               //  fontWeight: FontWeight.bold,
                                                                ),)
                                            ],
                                          ),
                                        ],
                                      ),
                                      //subtitle: 
                                     //
                              
                                      //title: Text('name',style:TextStyle(color:Colors.black)),
                                    ),
                                    ListTile(
                                      //leading: Text(i['time'].toString(),style:TextStyle(color:Colors.black)),
                                      title: Text("Total",style: GoogleFonts.ibmPlexMono(
                   // fontSize: 24,
                   fontWeight: FontWeight.bold,
                  ),),
                                      subtitle: Text(i['time'].toString().split(",")[0].toString(),style: GoogleFonts.inconsolata(
                   // fontSize: 24,
                   // fontWeight: FontWeight.bold,
                  ),),
                                      trailing: Text(i['totalprice'].toString() +
                                          '\tKES',style: GoogleFonts.ibmPlexMono(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),), //
                              
                                      //title: Text('name',style:TextStyle(color:Colors.black)),
                                    ),
                                    Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        /*Center(child:Container(
              height: 70, width: 70, child: Image.asset("assets/nlogo.png")),),*/
                                        Text("Freshfit Retail",style: GoogleFonts.paytoneOne(color: Colors.black,fontWeight:FontWeight.normal)),
                                      ],
                                    ),),
                  SizedBox(
                    height: 10,
                  )
                                  ])),
                            )

                    //play within this boundaries
                    ),
          ],
        )),
      ),
      /*bottomNavigationBar:Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
         children:[InkWell(child:Tab(
           //onPressed:(){},
                                    icon:CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      
                                      child: CircleAvatar(
                                        child: Icon(Icons.store,
                                          color: Colors.green),
                                          backgroundColor: Colors.white,
                                      
                                    )),
                                    child: Text(
                                      "Orders",
                                      style: TextStyle(color: Colors.black),
                                    ))),
                                    
                                    /*InkWell(child:Tab(
                                    icon: CircleAvatar(
                                      child: Icon(Icons.restaurant,
                                          color: Colors.green),
                                      backgroundColor: Colors.yellow,
                                    ),
                                    child: Text(
                                      "Menu",
                                      style: TextStyle(color: Colors.black),
                                    )),onTap:(){
                                      Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>Rutimetable(
                                                  title:'1',
                                                  token: widget.token,
                                                  user:'Restaurant Menu'
                                                )
                                                    
                                                ), //MaterialPageRoute
                                          );


                                   
                                    }),
                                    InkWell(child:Tab(
                                    icon: CircleAvatar(
                                      child: Icon(Icons.query_stats,
                                          color: Colors.green),
                                      backgroundColor: Colors.yellow,
                                    ),
                                    child: Text(
                                      "Data",
                                      style: TextStyle(color: Colors.black),
                                    )),onTap:(){
                                      Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>stats(
                                                  title:'1',
                                                  token: widget.token,
                                                  user:'Restaurant Menu'
                                                )
                                                    
                                                ), //MaterialPageRoute
                                          );


                                   
                                    })*/
                                    
                                    ]),*/
      /*floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.green,//.withOpacity(0.9),
        onPressed: (){
          //getWeather();
          //rono = false;
        },//_incrementCounter,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
