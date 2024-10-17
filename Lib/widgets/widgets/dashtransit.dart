import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class dashtransit extends StatefulWidget {
  dashtransit({
    key,
    required this.date,
    required this.month,
    required this.time,
  });
  String date;
  String month;
  String time;

  @override
  State<dashtransit> createState() => _dashtransitState();
}

class _dashtransitState extends State<dashtransit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Row(children: [
              Container(
                height: 90,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0))),
                width: MediaQuery.of(context).size.width * .25,
                child: Center(
                  child: ListTile(
                    title: Text(
                      "Oct",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "18",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade50,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => fteacher(
                                           pic_url: widget.pic_url,
                                  username: widget.username,
                                  information: widget.information,
                                  token: widget.token,
                                        )));*/
                },
                child: Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width * .69,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Center(
                    child: Wrap(alignment: WrapAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Picked up at 8.00 am",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
