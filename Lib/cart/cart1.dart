import 'dart:convert';

import 'package:FreshFit/menu.dart';
import 'package:FreshFit/preorder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
class Cart1 extends StatefulWidget {
  /*
   title: 'notnewuser',
                                                                                                                        token: widget.token,
                                                                                                                        user: widget.user,
                                                                                                                        //final String food1;
                                                                                                                        me: widget.me,
                                                                                                                        firstname: widget.firstname,
                                                                                                                        id: widget.id
  user
  widget.lang2
   amount3.remove(i);
                                                                                  cart.remove(i);
                                                                                  amount2.remove(i);
                                                                                  amount2 = amount2;
                  
                                                                                  amount.remove((int.parse(i[0]['price']) * int.parse(i[1].toString())));
                                                                               
  */
 Cart1({Key? key,required this.text1,required this.leo,required this.now,required this.scaffold1,required this.user,required this.lang2,required this.amount2,required this.amount,required this.amount3,required this.cart,required this.token,required this.me,required this.firstname,required this.geolocation, required this.id}) : super(key: key);
 Color text1;
 String leo;
 String now;
 var geolocation;
 Color scaffold1;
 String user;
 String me;
 String lang2;
 //required this.user,required this.cart,required this.me,required this.firstname,
 String firstname;
 
 int id;
 String token;
 List cart;
 List amount2;
 List amount3;
 List amount;

  @override
  State<Cart1> createState() => _Cart1State();
}

class _Cart1State extends State<Cart1> {
   
  @override
  Widget build(BuildContext context) {
  num sum = 0;
  var amount = widget.amount;
  var amount2= widget.amount2;

  var leo=widget.leo;
  late var selectedTime = TimeOfDay.now();
  for (num e in amount) {
      sum += e;
      print(sum);
      //sumx = sum;
    }
    var cart;
    Future createAlbumx(
      String sender, String message_me, String receiver, String time) async {
    //print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/chatff/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'name': 'Groupbuy', //groupbuy
        'sender': sender, //widget.me.toString(), //you
        'message_me':
            message_me, //'${amount2.toString()}', //ie '2/rono|re|amount|3
        'receiver': receiver,
        //widget.user.split('|')[0].split('/')[1].toString(), //parent user
        'time': time
        //now.toString() + '|' + leo.toString(),
      }),
    );
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);

    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }
  }

    Future addata(String otype, String zum, String otime, String oname) async {
    String token = widget.token.toString();
    //print('ruined sum' + zum.toString());
    //print('rono' + token);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token ${token}',
    };
    http.Response responsev =
        await http.post(Uri.parse('http://192.168.100.18:8000/orderff/'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Token $token',
            },
            body: jsonEncode(<String, String>{
              'table': widget.user.toString(),
              'food': '${amount2.toString()}', //list for food
              'restaurantx':'idk', //sky['username'].toString(),
              'time': widget.now.toString() + '\t ,' + widget.leo.toString(),
              'owner': widget.me.toString(),

              'totalprice': zum.toString(),
              'ordertype': otype.toString(),
              'ordername': oname.toString(),
              'ordertrak': 'not ready',
              'ordertime': otime.toString(),
              //'customer':now.toString()+'\t ,'+leo.toString(),
            }));
    //returns json body from api
    //var resultsX = jsonDecode(responsevX.body); //returns json body from api
  }


    return Scaffold(
                                                            backgroundColor:
                                                                widget.scaffold1,
                                                            appBar: AppBar(
                                                            
                                                                centerTitle: true,
                                                                leading:
                                                                    const SizedBox(),
                                                                title: Text("",
                                                                    style: GoogleFonts.lato(
                                                                        color: Colors
                                                                            .black)),
                                                                elevation: 0.0,
                                                                backgroundColor:
                                                                    widget.scaffold1),
                                                            body: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .78,
                                                              child:
                                                                  SingleChildScrollView(
                                                                      child: Column(
                                                                children: [
                                                                  AppBar(
                                                                      centerTitle:
                                                                          true,
                                                                      title: Text(
                                                                          widget.lang2 != "Kiswahili (🇰🇪)"
                                                                              ? "Cart"
                                                                              : "Mkoba",
                                                                          style: GoogleFonts.lato(
                                                                              color:
                                                                                  widget.text1)),
                                                                      elevation:
                                                                          0.0,
                                                                      backgroundColor:
                                                                          widget.scaffold1),
                                                                  Text(
                                                                      widget.lang2 !=
                                                                              "Kiswahili (🇰🇪)"
                                                                          ? "You're planning to order :"
                                                                          : "Unapanga kununua :",
                                                                      style: GoogleFonts
                                                                          .lato(
                                                                              color:
                                                                                  widget.text1)),
                                                                  ...widget.cart.map(
                                                                    //title:cart,title2:quantity.toString(),title3:amount
                                                                    (i) => ListTile(
                                                                      leading:
                                                                          InkWell(
                                                                              child:
                                                                                  CircleAvatar(
                                                                                backgroundColor:
                                                                                    widget.scaffold1,
                                                                                child:
                                                                                    const Icon(
                                                                                  Icons.delete,
                                                                                  color: Colors.red,
                                                                                ),
                                                                              ),
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  widget.amount3.remove(i);
                                                                                  widget.cart.remove(i);
                                                                                  widget.amount2.remove(i);
                                                                                  widget.amount2 = amount2;
                  
                                                                                  widget.amount.remove((int.parse(i[0]['price']) * int.parse(i[1].toString())));
                                                                                  Navigator.pop(context);
                                                                                });
                                                                              }),
                                                                      title: Text(
                                                                          i[0][
                                                                              'name'],
                                                                          style: GoogleFonts.lato(
                                                                              color:
                                                                                  widget.text1)),
                                                                      subtitle: Text(
                                                                          i[1]
                                                                              .toString(),
                                                                          style: GoogleFonts.lato(
                                                                              color:
                                                                                  widget.text1)), //
                                                                      trailing: Chip(
                                                                          backgroundColor:
                                                                              Colors
                                                                                  .yellow,
                                                                          label: Text(
                                                                              (int.parse(i[0]['price']) * int.parse(i[1].toString())).toString() +
                                                                                  '\t' +
                                                                                  "KES",
                                                                              style:
                                                                                  GoogleFonts.lato(fontWeight: FontWeight.bold))),
                                                                    ),
                                                                    //amount.add((int.parse(i[0]['price'])*int.parse(i[1].toString())))
                                                                  )
                                                                ],
                                                              )),
                                                            ),
                                                            //bottoma navigation bar
                                                            bottomNavigationBar:
                                                                Container(
                                                              color: widget.scaffold1,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    .147,
                                                                child: Card(
                                                                  elevation: 0,
                                                                  color: widget.scaffold1,
                                                                  child: Column(
                                                                      children: [
                                                                        ListTile(
                                                                          title: Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.end,
                                                                              children: [
                                                                                /*Text('Total\t:'),Text(sum.toString()+'\tKES',style:GoogleFonts.lato(fontSize:25,fontWeight:FontWeight.bold ,color:Colors.green))*/
                                                                              ]),
                                                                          subtitle:  /*FloatingActionButton.extended(
                                                                            backgroundColor: Colors.amber,
                                                                            //icon: Icon(Icons.flatware_outlined),
                                                                            label: Text("Enter your Mpesa Phone number to complete"),
                                                                            onPressed: () {
                                                                              mpesacall();
                                                                            })*/
                                                                               FloatingActionButton.extended(
                                                                                  backgroundColor: Colors.green,
                                                                                  //icon: Icon(Icons.flatware_outlined),
                                                                                  label: Text(widget.lang2 != "Kiswahili (🇰🇪)" ? "Proceed to Payments" : "Endelea ndio ulipe"),
                                                                                  onPressed: () {
                                                                                    //start checkout
                                                                                    //sum.toDouble()
                                                                                    showModalBottomSheet(
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          //sum = 0;
                                                                                          //var given_list = [1, 2, 3, 4, 5];
                                                                                          //this was once an issue it made the sum double
                                                                                          /*for (var i = 0; i < amount.length; i++) {
                                                                                                            sum += amount[i];
                                                                                                            };*/
                                                                                          return Scaffold(
                                                                                            backgroundColor: widget.scaffold1,
                                                                                            appBar: AppBar(centerTitle: true, title: Text(widget.lang2 != "Kiswahili (🇰🇪)" ? "Your Order" : "Order Yako", style: GoogleFonts.lato(color: widget.text1)), elevation: 0.0, backgroundColor: widget.scaffold1),
                                                                                            body: SingleChildScrollView(
                                                                                                child: Column(
                                                                                              children: [
                                                                                                Text(widget.lang2 != "Kiswahili (🇰🇪)" ? "Your total is $sum KES" : "Jumla Yako ni $sum KES", style: GoogleFonts.lato(fontSize: 28, color: widget.text1)),
                                                                                                const Text(""),
                                                                                                /*wild == null //wild is address name
                                                                                                    ? const Text("")
                                                                                                    : ListTile(title: Chip(avatar: const Icon(Icons.delivery_dining), label: Text("${wild}"))),
                                                                                                !address && wild == null
                                                                                                    ? FloatingActionButton.extended(
                                                                                                        backgroundColor: Colors.teal,
                                                                                                        //icon: Icon(Icons.flatware_outlined),
                                                                                                        label: const Text('Pick delivery address'),
                                                                                                        onPressed: () {
                                                                                                          setState(
                                                                                                            () {
                                                                                                              address = true;
                                                                                                            },
                                                                                                          );
                                                                                                          showPlacePicker();
                                                                                                          //Navigator.pop(context);
                                                                                                          //Navigator.pop(context);
                                                                                                        })
                                                                                                    : titleController4.text == ""
                                                                                                        ? Center(
                                                                                                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                                              Container(
                                                                                                                width: MediaQuery.of(context).size.width * .7,
                                                                                                                child: Padding(
                                                                                                                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                                                                                                                  //padding: EdgeInsets.symmetric(horizontal: 15),
                                                                                                                  child: TextField(
                                                                                                                    controller: titleController4,
                                                                                                                    obscureText: false,
                                                                                                                    decoration: InputDecoration(
                                                                                                                        filled: true,
                                                                                                                        fillColor: Colors.grey[100],
                                                                                                                        //fillColor: Colors.white,
                                                                                                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  
                                                                                                                        //border: OutlineInputBorder(),
                                                                                                                        labelText: 'Mpesa phone number',
                                                                                                                        hintText: 'Enter your Mpesa Phone number'),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                width: MediaQuery.of(context).size.width * .1,
                                                                                                                child: FloatingActionButton(
                                                                                                                  mini: true,
                                                                                                                  onPressed: () {},
                                                                                                                  child: const Icon(Icons.done),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ]),
                                                                                                          )
                                                                                                        : Container(
                                                                                                            child: Column(
                                                                                                            children: [
                                                                                                              works == '' ? const Text("initializing payments") : const Text("Confirm"),
                                                                                                              const ListTile(title: const Text("")),
                                                                                                              works == ''
                                                                                                                  ? const Center(
                                                                                                                      child: CircularProgressIndicator(),
                                                                                                                    )
                                                                                                                  : ListTile(
                                                                                                                      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                                                                        /*Text('Total\t:'),Text(sum.toString()+'\tKES',style:GoogleFonts.lato(fontSize:25,fontWeight:FontWeight.bold ,color:Colors.green))*/
                                                                                                                      ]),
                                                                                                                      //does not work trailing: Icon(Icons.arrow_circle_left_outlined),
                                                                                                                      subtitle: !softkey
                                                                                                                          ? FloatingActionButton.extended(
                                                                                                                              backgroundColor: Colors.teal,
                                                                                                                              //icon: Icon(Icons.flatware_outlined),
                                                                                                                              label: const Text(//Container(child: CircularProgressIndicator()):
                                                                                                                                  'confirm Order'),
                                                                                                                              //    icon: Icon(Icons.arrow_circle_left_outlined),
                                                                                                                              onPressed: () {
                                                                                                                                print("${selectedTime.hour}:${selectedTime.minute + 10}");
                  
                                                                                                                                widget.user.toString() == 'Menu'
                                                                                                                                    ? showModalBottomSheet(
                                                                                                                                        context: context,
                                                                                                                                        builder: (context) {
                                                                                                                                          return const Scaffold();
                                                                                                                                        })
                                                                                                                                    : '';
                                                                                                                                widget.user.split('|').length < 2
                                                                                                                                    ? addata(widget.user.toString() == 'Menu' ? "Timed preorder" : "Summoning Waiter", '$sum', "${selectedTime.hour}:${selectedTime.minute}", 'ordername2')
                                                                                                                                    : createAlbumx(
                                                                                                                                        '${widget.me.toString() + '|' + widget.user.toString() + '|' + sum.toString()}',
                                                                                                                                        '${amount2.toString()}',
                                                                                                                                        widget.user.split('|')[0].toString(), //,//widget.user.split('|')[0].split('/')[1].toString(),
                                                                                                                                        leo.toString());
                                                                                                                                Navigator.pop(context);
                                                                                                                                Navigator.push(context, MaterialPageRoute(builder: (context) => widget.user.toString() == 'Menu' ? screenxc2(title: "${selectedTime.hour}:${selectedTime.minute}") : screenxc2(title: "${selectedTime.hour}:${selectedTime.minute}")));
                                                                                                                                //Navigator.pop(context);
                                                                                                                                //Navigator.pop(context);
                                                                                                                                cart.clear();
                                                                                                                                setState(() {
                                                                                                                                  cart.length = 0;
                                                                                                                                  amount = [];
                                                                                                                                });
                                                                                                                              })
                                                                                                                          : Container(width: 20)),
                                                                                                            ],
                                                                                                          ))*/
                  
                                                                                                //remove this section
                  
                                                                                                FloatingActionButton.extended(
                                                                                                    backgroundColor: Colors.teal,
                                                                                                    //icon: Icon(Icons.flatware_outlined),
                                                                                                    label: Text(//Container(child: CircularProgressIndicator()):
                                                                                                        widget.lang2 != "Kiswahili (🇰🇪)" ? 'confirm Order' : "Thibitisha Order"),
                                                                                                    //    icon: Icon(Icons.arrow_circle_left_outlined),
                                                                                                    onPressed: () {
                                                                                                      print("${selectedTime.hour}:${selectedTime.minute + 10}");
                  
                                                                                                      widget.user.toString() == 'Menu'
                                                                                                          ? showModalBottomSheet(
                                                                                                              context: context,
                                                                                                              builder: (context) {
                                                                                                                return const Scaffold();
                                                                                                              })
                                                                                                          : '';
                                                                                                      widget.user.split('|').length < 2
                                                                                                          ? addata(widget.user.toString() == 'Menu' ? "Timed preorder" : "Summoning Waiter", '$sum', "${selectedTime.hour}:${selectedTime.minute}", 'ordername2')
                                                                                                          : createAlbumx(
                                                                                                              '${widget.me.toString() + '|' + widget.user.toString() + '|' + sum.toString()}',
                                                                                                              '${amount2.toString()}',
                                                                                                              widget.user.split('|')[0].toString(), //,//widget.user.split('|')[0].split('/')[1].toString(),
                                                                                                              leo.toString());
                                                                                                      Navigator.pop(context);
                                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => widget.user.toString() == 'Menu' ? screenxc2(title: "${selectedTime.hour}:${selectedTime.minute}") : screenxc2(title: "${selectedTime.hour}:${selectedTime.minute}")));
                                                                                                      //Navigator.pop(context);
                                                                                                      //Navigator.pop(context);
                                                                                                      cart.clear();
                                                                                                      setState(() {
                                                                                                        cart.length = 0;
                                                                                                        amount = [];
                                                                                                      });
                                                                                                    }),
                                                                                                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                                                  //*/
                                                                                                  const SizedBox(height: 20),
                  
                                                                                                  const SizedBox(height: 10),
                                                                                                  ListTile(
                                                                                                      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                                                        /*Text('Total\t:'),Text(sum.toString()+'\tKES',style:GoogleFonts.lato(fontSize:25,fontWeight:FontWeight.bold ,color:Colors.green))*/
                                                                                                      ]),
                                                                                                      subtitle: FloatingActionButton.extended(
                                                                                                          backgroundColor: Colors.redAccent,
                                                                                                          //icon: Icon(Icons.flatware_outlined),
                                                                                                          label: Text(widget.lang2 != "Kiswahili (🇰🇪)" ? "Cancel" : "wacha"),
                                                                                                          onPressed: () {
                                                                                                            cart.clear();
                                                                                                            amount.clear();
                                                                                                            sum = 0;
                                                                                                            Navigator.push(
                                                                                                                context,
                                                                                                                MaterialPageRoute(
                                                                                                                    builder: (context) => Rutimetable(
                                                                                                                        title: 'notnewuser',
                                                                                                                        token: widget.token.toString(),
                                                                                                                        user: widget.user,
                                                                                                                        //final String food1;
                                                                                                                        me: widget.me,
                                                                                                                        firstname: widget.firstname,
                                                                                                                        id: widget.id.toString(), geolocation: widget.geolocation,)));
                                                                                                          }))
                  
                                                                                                  /*ListTile(
                                                                                        title: Row(
                                                                                            mainAxisAlignment:
                                                                                                MainAxisAlignment.end,
                                                                                            children: [
                                                                                              /*Text('Total\t:'),Text(sum.toString()+'\tKES',style:GoogleFonts.lato(fontSize:25,fontWeight:FontWeight.bold ,color:Colors.green))*/
                                                                                            ]),
                                                                                        subtitle: FloatingActionButton.extended(
                                                                                            backgroundColor: Colors.yellow[700],
                                                                                            //icon: Icon(Icons.flatware_outlined),
                                                                                            label: Text(widget.user.toString() == 'Menu' ? "set time for order" : "Other"),
                                                                                            onPressed: () {
                                                                                              sum =
                                                                                                  0;
                                                                                              for (var i = 0;
                                                                                                  i < amount.length;
                                                                                                  i++) {
                                                                                                sum += amount[i];
                                                                                              }
                                                                                              ;
                                                                                              _selectTime(BuildContext context) async {
                                                                                                final timeOfDay = await showTimePicker(
                                                                                                  context: context,
                                                                                                  initialTime: selectedTime,
                                                                                                  initialEntryMode: TimePickerEntryMode.dial,
                                                                                                );
                                                                                                if (timeOfDay != null && timeOfDay != selectedTime) {
                                                                                                  //setState(() {
                                                                                                  selectedTime = timeOfDay;
                                                                                                }
                                                                                              }
                                                                                                      
                                                                                              ;
                                                                                              _selectTime(context);
                                                                                              print("${selectedTime.hour}:${selectedTime.minute + 10}");
                                                                                                      
                                                                                              //timed order
                                                                                            }))*/
                                                                                                ]),
                                                                                              ],
                                                                                            )),
                                                                                            //bottoma navigation bar
                                                                                            bottomNavigationBar: Container(
                                                                                              height: 60,
                                                                                              child: const Align(alignment: Alignment.topCenter, child: null
                                                                                                  /*Container(
                                                                            width: _bannerAd
                                                                                .size
                                                                                .width
                                                                                .toDouble(),
                                                                            height: 100,
                                                                            child: AdWidget(
                                                                                ad:
                                                                                    _bannerAd,
                                                                                key:
                                                                                    UniqueKey()),
                                                                          ),*/
                                                                                                  ),
                                                                                            ),
                                                                                          );
                                                                                        });
                                                                                    /*Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) =>trakstar(title:cart2),
                                                                              ),
                                                                            );*/
                                                                                  } //scanQR(),
                  
                                                                                  // This trailing comma makes auto-formatting nicer for build methods.
                                                                                  ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 2,
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              60,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                Alignment.topCenter,
                                                                            child:null
                                                                                /*Container(
                                                                              width: _bannerAd
                                                                                  .size
                                                                                  .width
                                                                                  .toDouble(),
                                                                              height:
                                                                                  100,
                                                                              child:
                                                                                  null /*AdWidget(
                                                            ad: _bannerAd,
                                                            key: UniqueKey())*/
                                                                              ,
                                                                            ),*/
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 2,
                                                                        )
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                       
  }
}