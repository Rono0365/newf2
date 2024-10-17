
import 'package:FreshFit/verifynow/verifynow/verifyservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

//import '../verifynow/verifyservice.dart';

class finance8 extends StatefulWidget {
  const finance8({
    key,
    required this.username,
    required this.token,
    required this.information,
    required this.pics,
  });

  final String username;
  final List information;

  final String token;
  final List pics;
  @override
  State<finance8> createState() => _finance8State();
}

class _finance8State extends State<finance8> {
  stacknotes() {
    /*
   information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString()
  */

    var n = widget.information == null
        ? []
        : widget.information.reversed
            .where((u) =>
                u['title'].contains('finance') &&
                u["writer"] != widget.username &&
                u['whoiswho'] == widget.username.toString())
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

    return t == null ? [] : zz;
  }

  @override
  void initState() {
    super.initState();
    print(widget.information);
    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          elevation: 0,
          leading: const SizedBox(),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            ListTile(
              title: Text(
                "Notifications",
                style: GoogleFonts.rubik(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              trailing: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Ionicons.close, color: Colors.white)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...stacknotes()
                        //lazy coding
                        .map((x) => Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: NotificationCard(
                                    token: widget.token,
                                    pic_url: widget.pics,
                                    time: x["date"].toString(),
                                    title: x["writer"].toString(),
                                    message: x["mation"].toString(),
                                    iconData: Icons.notifications_on,
                                  ),
                                ) // Convert the Iterable to a List to use the sort method
                                // Convert and sort the List based on the numeric value of the 'id' property
                              ],
                            ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String token;
  //final String pics;
  final String message;
  final String time;
  final IconData iconData;
  final Color iconColor;
  final List pic_url;
  const NotificationCard({key, 
    required this.title,
    required this.token,
    required this.time,
    required this.pic_url,
    required this.message,
    required this.iconData,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.black),
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
                            title.toString().substring(0, 1),
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    ...pic_url
                        .where((c) => c['username1'] == title.toString())
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
                  darkmode: true,
                  username: title,
                  token: token,
                ),
                subtitle: Text(
                  "${time.split("|")[0].toString()} at ${time.split("|")[1].toString().replaceAll("?", "")}",
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .78,
                    height: 0.7,
                    color: Colors.black,
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  message,
                  style:
                      GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
