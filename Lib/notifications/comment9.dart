
import 'package:FreshFit/verifynow/verifynow/verifyservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import "dart:convert";
import "package:http/http.dart" as http;
//import '../verifynow/verifyservice.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({
    key,
    required this.username,
    required this.darkmode,
    required this.token,
    required this.information,
    required this.pics,
  });

  final String username;
  final List information;
  var darkmode;
  final String token;
  final List pics;
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var informationz=[];
  stacknotes() {
    var n = informationz.reversed
        .where((u) =>
            //u['title'].contains('message') &&
            u["to"].toString().contains(widget.username.toString()) &&
            u['whoiswho'].contains(widget.username.toString()))
        .toSet()
        .toList();

    return n; //.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString())).toString();
  }

  truth(var t) {
    var yy = t
        .toList()
        .reversed
        .where((h) => h.toString() != "()")
        .map((x) => x.where((g) => g != null).map((c) => c));
    var zz = [...yy];

    return zz;
  }

  @override
  void initState() {
    super.initState();
  getWealth2() async {
    String token = widget.token.toString();
    //String id = widget.userid.toString();

    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response responsev = await http
        .get(Uri.parse('http://192.168.100.18:8000/orderff/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    http.Response response2 = await http
        .get(Uri.parse('http://192.168.100.18:8000/information/'), headers: headers);
    var xcv2 = jsonDecode(response2.body);

    ;
    //raw();
   setState((){
 ///   food2 = xcv;
    informationz = xcv2;  
   });
      
  
    //print(food1);
  }
getWealth2();
    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            widget.darkmode ? Colors.grey.shade900 : Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          leading: const SizedBox(),
          backgroundColor: Colors.transparent,
        ),
        body:
       Column(
       children: [
        ListTile(
              title: Text(
                "Notifications",
                style: GoogleFonts.rubik(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: widget.darkmode ? Colors.white : Colors.black),
              ),
              trailing: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Ionicons.close, color: widget.darkmode? Colors.white:Colors.black)),
            ),
        informationz == null? SizedBox(
              height: MediaQuery.of(context).size.height * .8,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                
                 SizedBox(
                                height: 250,
                                width: 250,
                                child: 
                                  Lottie.asset('assets/notification.json'),),
                                  Center(
                                    child:  Text(
                                                 'You have no notifications',
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.rubik(
                                                    //fontSize: 23,
                                                    //fontWeight: FontWeight.bold,
                                                    color: Colors.grey)),
                                  )
               ],
             ),
           ):   SizedBox(
            height: MediaQuery.of(context).size.height * .8,
             child: ListView(
             //  mainAxisAlignment: MainAxisAlignment.start,
               children: [
                //Text(widget.),
                // Text("${informationz.where((u)=> u["to"].replaceAll(" ","").toString()==widget.username.replaceAll(" ","") )}"),
                        
                 ...informationz.reversed.where((u)=> u["to"]==widget.username &&
                         u['whoiswho']==widget.username.toString()).toList()
                     //lazy coding
                     .map((x) =>
                     
                   //  ListTile(title:Text(x.toString()) ,)
                     
                     Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: NotificationCard(
                         darkmode: widget.darkmode,
                         token: widget.token,
                         pic_url: widget.pics,
                         time: x["date"].toString(),//"x[].toString()",
                         title: x["writer"].toString(),//"x[""].toString()",
                         message: x["mation"].toString(),//"x[].toString()",
                         iconData: Icons.notifications_on,
                       ),
                     ))
               ],
             ),
           )
    ]));
         
       
     
        
        
           
         
  }
}


class NotificationCard extends StatefulWidget {
  final String title;
  final String token;
  //final String pics;
  final String message;
  final String time;
  final IconData iconData;
  final Color iconColor;
  final List pic_url;
  var darkmode;
  NotificationCard({key, 
    required this.title,
    required this.darkmode,
    required this.token,
    required this.time,
    required this.pic_url,
    required this.message,
    required this.iconData,
    this.iconColor = Colors.blue,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return
     Container(
      padding: const EdgeInsets.all(8.0),
    
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: widget.darkmode?Colors.grey.shade800.withOpacity(0.3):Colors.white),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          /*
          
          homewidget(
        {Key? key,
        required this.name,
        //required this.indexprimo,
        required this.title,
        required this.Id,
        required this.chip,
        
        required this.token,
        required this.people,
        required this.peoplex,
        required this.postdata,
        required this.image,
        required this.imagez,
        required this.imagez1,
        required this.imagez2,
        required this.imagez3,
        required this.text,
        required this.time1,
        required this.myusername,
        required this.time2})
        : super(key: key);
        )
          */
          children: [
            ListTile(
              trailing: Container(
                child: Stack(children: [
                  CircleAvatar(
                    radius: 22,
                    // backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.cyan.shade100,
                      child: Center(
                        child: Text(
                          widget.title.toString().substring(0, 1),
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  ...widget.pic_url
                      .where((c) => c['username1'] == widget.title.toString())
                      .map(
                        (ui) => CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          //backgroundColor: Colors.green,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
    
                            backgroundImage: NetworkImage(
                              ui['image'].replaceAll(" ", ''),
                            ), //ui['image'],
                          ),
                        ),
                      ),
                ]),
              ),
              title: verifyme(
                darkmode: widget.darkmode,
                username: widget.title,
                token: widget.token,
              ),
              subtitle: widget.time == "no date"
                  ? const SizedBox()
                  : Text(
                      "${widget.time.split("|")[0].toString()} at ${widget.time.split("|")[1].toString().replaceAll("?", "")}",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 0.07,
                  color: Colors.grey,
                ),
              ],
            ),
            ListTile(
              title: Text(
                widget.message,
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: widget.darkmode?Colors.white:Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
