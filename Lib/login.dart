// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison


import 'package:audioplayers/audioplayers.dart';

import 'legal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
//import 'netcloud.dart';
//import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppL extends StatefulWidget {
   MyAppL({
    key,
    required this.title,
    required this.username1,
  });

  final String title;
  final String username1;

  @override
  _MyAppLState createState() => _MyAppLState();
}

class _MyAppLState extends State<MyAppL> {
  //final audioCache = AudioPlayer();
  final audioCache = AudioPlayer();
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  //final titleController = TextEditingController();
  //final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  final titleControllerv = TextEditingController();

  var passtok;
  var userid;
  var userid1;
  var findstudent = [];
  var userid2;
  var userid3;
  final googleSignIn = GoogleSignIn();
  var opend2 = 0;
  var opend3 = 0;
  var _name;
  var firstnameg;
  var lastnameg;
  var usernameg;
  var img11;
  var passwordg;
  var _emailg;
  var studentdet;

  Future _signInWithGoogle() async {
    final googleSignInAccount = await googleSignIn.signIn();
    //final googleSignInAccount = await googleSignIn.signIn();
    final displayName = googleSignInAccount!.displayName;
    final email = googleSignInAccount.email;
    final img11x = googleSignInAccount.photoUrl;
    final nameSplit = displayName.toString().split(" ");

    setState(() {
      firstnameg = nameSplit.first;
      lastnameg = nameSplit.last;
      usernameg = firstnameg + lastnameg;
      _emailg = email.toString();
      img11 = img11x.toString();
    });
  }
  void addaccount(String cusername) async {
    var z = widget.username1
        .toString()
        .replaceAll("|", ",")
        .replaceAll("[", ",")
        .replaceAll("]", ",")
        .split(",")[0];
    var y = widget.username1
        .toString()
        .replaceAll("|", ",")
        .replaceAll("[", ",")
        .replaceAll("]", ",")
        .split(",")[1];
    var x = widget.username1
        .toString()
        .replaceAll("|", ",")
        .replaceAll("[", ",")
        .replaceAll("]", ",")
        .split(",")[2];        
    //for first account
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/event/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': cusername,
        "skills": "[${z},${y},${x}]",
        "date": "nyiet",
        "title": "nyiet",
        "location": "nyiet"
      }),
    );
    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }
  }
  void addaccount1(String cusername) async {
    var z = widget.username1
        .toString()
        .replaceAll("|", ",")
        .replaceAll("[", ",")
        .replaceAll("]", ",")
        .split(",")[0];
    //for first account
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/event/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': z,
        "skills": "[$cusername,$PassToken,$userid]",
        "date": "nyiet",
        "title": "nyiet",
        "location": "nyiet"
      }),
    );
    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }
  }

  void addaccount2(String cusername,String token,String id) async {
    var z = widget.username1
        .toString()
        .replaceAll("|", ",")
        .replaceAll("[", ",")
        .replaceAll("]", ",")
        .split(",")[0];
    //for first account
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/event/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': z,
        "skills": "[$cusername,$token,$id]",
        "date": "nyiet",
        "title": "nyiet",
        "location": "nyiet"
      }),
    );
    if (response1.statusCode == 201) {
      //print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }
  }


  void createverification(String username) async {
    //print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/verified2/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        "username1": username,
        "image": "Homeapp",
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);

    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }

  bool pressd = false;
  int State = 0;
  int State2 = 0;
  var usercorrecion;
  bool obsc = true;
  //var passtok;
  String PassToken = '';
  String ID = '';
  final storage = const FlutterSecureStorage();
  //var userid;
  var value;
  //int State = 0;
  fireOne() {
    audioCache.play(AssetSource('assets/notificationz.mp3'));

    //FlameAudio.play('assets/notificationz.mp3');
  }

  Future getStudent() async {
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.18:8000/students/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
    );
    var result5 = jsonDecode(response1.body);
    setState(() {
      studentdet = result5;
    });
  }

  verified8() async {
    //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/verified2/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('findstudent', json.encode(verified1));
    setState(() {
      findstudent = verified1;
    });

    //print(verifiedx);
    //}
  }

  getWdimention(int x) {
    var width = MediaQuery.of(context).size.width;
    var convertedWidth = (x.round()) / 350 * width;

    return convertedWidth;
  }

  getHdimention(int x) {
    double height = MediaQuery.of(context).size.height;
    double convertedHeight = (x.round()) / 760 * height;
    return convertedHeight;
  }

  Future createpic() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/profpic/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': usernameg,
        'image': img11,
      }),
    );

    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);

    if (response1.statusCode == 201) {}

    //});
//save the token for next time
  }

  Future create1() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/registerff/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': titleController.text,
        'password': titleController1.text,
        'password2': titleController1.text,
        'email': titleController3.text,
        'first_name': titleController4.text,
        'last_name': titleControllerv.text,
      }),
    );

    //works => print(token['token']);

    var token = jsonDecode(response1.body);

    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    //var token = jsonDecode(response1.body);
  }

  Future opendoor(var studata, var infome) async {
    // var chck = findstudent.where((x) => x["image"] == infome);
    var cln = studata.where((x) => x["adm_no"] == infome);
    print(cln.length);

    opend2 = cln.length;
    //var opend3 = chck.length;

    //var cln2 = cln.contains("${infome}");

    return opend2;
  }

  Future opendoor2(var infome) async {
    //get student if registered before
    print(findstudent);
    var chck = findstudent.where((x) => x["image"] == infome);
    // var cln = studata.where((x) => x["adm_no"] == infome);
    //print(cln.length);

    //opend2 = cln.length;
    opend3 = chck.length;

    print(opend3);
    print(infome);
    return opend3;
  }

  Future create2() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/registerff/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': usernameg,
        'password': "xcsdrono2022",
        'password2': "xcsdrono2022",
        'email': _emailg,
        'first_name': firstnameg,
        'last_name': lastnameg,
      }),
    );

    //works => print(token['token']);

    var token = jsonDecode(response1.body);

    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    //var token = jsonDecode(response1.body);
  }

  Future logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    sharedPreferences.remove('key');
    //var idk = sharedPreferences.getString('key');
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final obtoken = sharedPreferences.getString('token');
    final idk = sharedPreferences.getString('key');
    //var idk = sharedPreferences.getString('key');

    setState(() {
      PassToken = obtoken!;
      ID = idk!;
    });
  }

  @override
  void initState() {
    //audioCache.setSourceAsset('assets/b_knock.mp3');
    //audioCache.setSourceAsset('assets/gulag_buzzer.mp3');
    audioCache.setSourceAsset('assets/notific.mp3');
    audioCache.setSourceAsset('assets/notification.mp3');
    audioCache.setSourceAsset('assets/notificationz.mp3');
    //audioCache.setSourceAsset('assets/postsmth.mp3');
    //audioCache.setSourceAsset('assets/sendsmth.mp3');

    widget.title == "" // error on here
        ? getValidation().whenComplete(() {
            PassToken != ""
                    ? Future.delayed(Duration.zero, () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyApp(
                                    title: 'notnewuser', //important
                                    token: PassToken,
                                    userid: ID)));
                      })
                    : Container()
                //MyAppL()
                //.whenComplete(() async {

                ;
            //print("here she comes:" + userid);
          })
        : widget.title == "addaccount"
            ? ""
            : logout();
    verified8();
    super.initState();
  }

  Future login7() async {
    createSubject() async {
      //print(utf8.encode(titleController.text));
      /*
    {"id":1,"nameq":"RetRono","school":"R.I.O.T","owner":"RetRono","commute":"arrived","place":"[\"langata\",\"Madaraka area\",\"Nyayo Estate area\"]","cordinates":"0.0,0.0"}
    */
      http.Response response1 = await http.post(
        Uri.parse('http://192.168.100.18:8000/students/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, //'id','sender','message_me','receiver','time'
        body: jsonEncode(<String, String>{
          //"username1": username,
          /*
       {"id":1,"School":"BazengaSchool","adm_no":"10900","owner":"Rono","Class":"1a","profpic":"jello"}
       */
          "profpic": "jello",
          "School": "Freshfit",
          "Class": "Freshfit",
          "adm_no": "$titleController",
          "owner": "$firstnameg"
        }),
      );
      ////print(jsonDecode(response1.data.toString()) );
      //works => //print(token['token']);
      print(response1.statusCode);

      if (response1.statusCode == 201) {
        var snackBar = const SnackBar(
          content: Text("Posted"),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
        //print(jsonDecode(response1.body.toString()));
      }

      //});
//save the token for next time
    }

    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/api-token-auth_forfF/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': firstnameg + lastnameg,
        'password': "xcsdrono2022",
      }),
    );

    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    var token = jsonDecode(response1.body);

    if (response1.statusCode == 200) {
      setState(() async {
        passtok = token['token'].toString();
        userid = token['user_id'].toString();
        await storage.write(key: userid, value: passtok);
        value = storage.read(key: userid);
        createSubject();
      });

      //});
//save the token for next time
    }
  }

  Future createAlbum() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/api-token-auth_forfF/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': titleController.text,
        'password': titleController1.text,
      }),
    );
    //print(response1);
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    var token = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      
      setState(() async {
        passtok = token['token'].toString();
        userid = token['user_id'].toString();
        await storage.write(key: userid, value: passtok);
        value = storage.read(key: userid);
      });

      //});
//save the token for next time
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(children: [
      SizedBox.expand(
        child: Image.asset(
          'assets/loginpic.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        extendBody: true,
        backgroundColor: widget.title == "addaccount"
            ? Colors.black.withOpacity(0.9)
            : Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(1.0)
              ],
              stops: const [0.1, 0.6, 0.7, 0.8, 1],
            ),
          ),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
          
           
            Container(
              width: MediaQuery.of(context).size.width 
                  , //getWdimention(400),
              height:
                  MediaQuery.of(context).size.height, // getHdimention(400),//MediaQuery.of(context).size.width>600?520:520,
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Card(
                    elevation: 0,
                    color: const Color.fromRGBO(186, 132, 132, 0),
                    child: Column(
             mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                                        
                       
                  
                        
                        ListTile(
                        
                          title: Row(children: [
                            Text(
                                widget.title == "addaccount"
                                    ? ""
                                    : "Start your\nDay with\nFresh fruits &\nVegetables ", // Connect Grow
                                style: GoogleFonts.rubik(
                                                                            fontSize: 42,
                                                                            fontWeight:FontWeight.bold,
                                                                            color: Colors.white)),
                            // textAlign: TextAlign.start,
                          ]),
                        ),
          
                        ListTile(
                            title: Text(
                                widget.title == "addaccount"
                                    ? ""
                                    : "",//Compassionate healthcare at your fingertips
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey))),
                        //ListTile(),
                        MediaQuery.of(context).size.width > 600
                            ? const SizedBox(width: 80)
                            : const SizedBox(),
                        MediaQuery.of(context).size.width <= 600
                            ? const SizedBox()
                            : ListTile(
                                title: Row(
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                      //maxHeight: 300,
                                      maxWidth: 520,
                                    ),
                                    child: Text(
                                      "Easily oversee your students' education, well-being, and safety with our all-in-one app, paving the way for a brighter future.",
                                      style: GoogleFonts.rubik(
                                          fontSize: 25,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  const Text(" "),
                                ],
                              )),
                              const SizedBox(
                              //  height:MediaQuery.of(context).size.height*.5,
                              )
                      ],
                    )),
              ),
            ),
          
            //Container(height: getWdimention(42)),
            //Container(height: 100,width: MediaQuery.of(context).size.width,color: Colors.white,)
            Container(
              height:widget.title == "addaccount"
                                    ?0: MediaQuery.of(context).size.height*.55,
              //  Container(height: getHdimention(50)),
            )
          ]),
        ),
        bottomNavigationBar: Container(
          height: getHdimention(180),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(1.0)
              ],
              stops: const [0.1, 0.6, 0.7, 0.8, 1],
            ),
          ),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
                child: Container(
                  height: getHdimention(47),
                  width: getWdimention(265),
                  //width: MediaQuery.of(context).size.width * 0.86,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0),
                        spreadRadius: 0,
                        blurRadius: 0,
                      )
                    ],
                  ),
                  child: TextButton(
                      onPressed: (() {
                        // audioCache.play(AssetSource('assets/notificationz.mp3'));
audioCache.play(AssetSource(
                                                      "notificationz.mp3"));
                        // getStudent();
                         verified8();
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              //  sum = 0;
                              //var given_list = [1, 2, 3, 4, 5];
                              return Scaffold(
                                                            backgroundColor: Colors.black,
                                                            appBar: AppBar(
                                                              backgroundColor: Colors.black,
                                                              elevation: 0,
                                                              leading: const SizedBox(),
                                                            ),
                                                            body: Container(
                                                              height: MediaQuery.of(context).size.height,
                                                              width: MediaQuery.of(context).size.width,
                                                              decoration: BoxDecoration(
                                                                color: Colors.transparent,
                                                                gradient: LinearGradient(
                                                                  begin: Alignment.topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors: [
                                                                    Colors.black.withOpacity(0.8),
                                                                    Colors.black.withOpacity(1.0),
                                                                    Colors.black.withOpacity(1.0)
                                                                  ],
                                                                  stops: const [0, 0, 0],
                                                                ),
                                                              ),
                                                              child: Card(
                                                                elevation: 0,
                                                                color: Colors.transparent,
                                                                child: SingleChildScrollView(
                                                                  child: Column(
                                                                    children: <Widget>[
                                                                      AppBar(
                                                                          elevation: 0,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          leading: InkWell(
                                                                            onTap: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: const Icon(
                                                                                Icons.arrow_back,
                                                                                color: Colors.white),
                                                                          ),
                                                                          title: Text(
                                                                            "Register", //amberlogin
                                                                            style: GoogleFonts.rubik(
                                                                                fontSize: 20,
                                                                                color: Colors.white),
                                                                          ),
                                                                          actions: [TextButton(
                                                                          child: const Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Log in',
                                                                                      style: TextStyle(
                                                                                        fontSize: 19.0,
                                                                                          color:
                                                                                              Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ]),
                                                                          onPressed: () {
                                                                               showModalBottomSheet(
                                                                                          isScrollControlled:
                                true,
                                                                                          context:
                                context,
                                                                                          builder:
                                (context) {
                              //  sum = 0;
                              //var given_list = [1, 2, 3, 4, 5];
                                                            
                              return Scaffold(
                                backgroundColor:
                                    Colors
                                        .grey
                                        .shade900,
                                body: Card(
                                  elevation:
                                      0,
                                  color: Colors
                                      .grey
                                      .shade900,
                                  child:
                                      SingleChildScrollView(
                                    child:
                                        Column(
                                      children: <Widget>[
                                        const ListTile(),
                                        AppBar(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            leading: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                titleController.clear();
                                              },
                                              child: const Icon(Icons.arrow_back, color: Colors.white),
                                            ),
                                            title: Text(
                                              "Log in", //amberlogin
                                              style: GoogleFonts.rubik(fontSize: 20, color: Colors.white),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.width * 0.20,
                                        ),
                                        Padding(
                                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: TextField(
                                            style: TextStyle(
                                                color: Colors.white,
                                               ),
                                            controller: titleController,
                                            decoration: InputDecoration(
                                              
                                               labelStyle:TextStyle(
                                                color: Colors.white,
                                               ),
                                                filled: true,
                                                fillColor: Colors.grey[900],
                                                //fillColor: Colors.white,
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                                labelText: 'Username',
                                                hintText: 'Enter your username'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                                          //padding: EdgeInsets.symmetric(horizontal: 15),
                                          child: TextField(
                                            style: const TextStyle(color: Colors.white),
                                            controller: titleController1,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                labelStyle:TextStyle(color: Colors.white),
                                                filled: true,
                                                fillColor: Colors.grey[900],
                                                //fillColor: Colors.white,
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                                            
                                                //border: OutlineInputBorder(),
                                                labelText: 'Password',
                                                hintText: 'Enter secure oo'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.width * 0.20,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context).size.height*.08,
                                          width: getWdimention(250),
                                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                                          child: TextButton(
                                            child: const Text(
                                              'Login',
                                              style: TextStyle(color: Colors.white, fontSize: 25),
                                            ),
                                            onPressed: () {
                                              createAlbum().whenComplete(() async {
                                                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                                sharedPreferences.setString('token', passtok.toString());
                                                sharedPreferences.setString('key', userid.toString());
                                                setState(() {
                                                  PassToken = passtok;
                                                });
                                                if (State == 200) {
                                                                                                      widget.title == "addaccount"?addaccount1(titleController.text):"";
                                                      widget.title == "addaccount"?addaccount(titleController.text):"";
   
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => MyApp(
                                                          title: titleController.text,
                                                          token: passtok,
                                                          userid: userid,
                                                        ),
                                                      ));
                                                  print('exis' + passtok);
                                                } else {
                                                  print('haiwork');
                                                  const snackBar = SnackBar(
                                                    content: Text("Please Try Again! There's an error with your credentials"),
                                                  );
                                                            
                                                  // Find the ScaffoldMessenger in the widget tree
                                                  // and use it to show a SnackBar.
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                              });
                                                            
                                              //print(State);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*.1,
                                          child:Text(
                                                                                              "\n  or  ",
                                                                                              style: GoogleFonts
                                                                                                  .lexend(
                                                                                                color:
                                                                                Colors.grey,
                                                                                                //backgroundColor: Colors.black,
                                                                                              ),
                                                                                            ),
                                        ),
                                          InkWell(
                                            onTap:() {
                                                setState(() {
                                                                                          logout();
                                                                                          _signInWithGoogle()
                                                                          .whenComplete(() =>
                                                                              login7().whenComplete(
                                                                                  () async {
                                                                                final SharedPreferences
                                                                                    sharedPreferences =
                                                                                    await SharedPreferences.getInstance();
                                                                                sharedPreferences.setString(
                                                                                    'token',
                                                                                    passtok);
                                                                                sharedPreferences.setString(
                                                                                    'key',
                                                                                    userid);
                                                                                setState(
                                                                                    () {
                                                                                  PassToken =
                                            passtok;
                                                                                });
                                                                                if (State ==
                                                                                    201) {
                                                                                  Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyApp(
                                                title: firstnameg + lastnameg,
                                                token: passtok,
                                                userid: userid,
                                              ),
                                            ));
                                                                                } else {
                                                                                  var snackBar =
                                            SnackBar(
                                                                                    content: usercorrecion == null
                                              ? const Text("something's wrong ")
                                              : Text(usercorrecion.toString()),
                                                                                  );
                                                              
                                                                                  // Find the ScaffoldMessenger in the widget tree
                                                                                  // and use it to show a SnackBar.
                                                                                  ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                                                                }
                                                                              }));
                                                                                        }
                                                                                            // createAlbumX();
                                                                                            );
                                            },
                                            child: ListTile(
                                                leading: Icon(
                                                                                                Ionicons
                                                                                .logo_google,
                                                                                                color:
                                                                                Colors.grey.shade900,
                                                                                              ),
                                              title: Center(
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Row(children: [
                                                      Column(
                                                                                        mainAxisAlignment:
                                                                                            MainAxisAlignment
                                                                                                .center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            onTap: () {
                                                                                              setState(() {
                                                                                                logout();
                                                                                                _signInWithGoogle()
                                                                                .whenComplete(() =>
                                                                                    login7().whenComplete(
                                                                                        () async {
                                                                                      final SharedPreferences
                                                                                          sharedPreferences =
                                                                                          await SharedPreferences.getInstance();
                                                                                      sharedPreferences.setString(
                                                                                          'token',
                                                                                          passtok);
                                                                                      sharedPreferences.setString(
                                                                                          'key',
                                                                                          userid);
                                                                                      setState(
                                                                                          () {
                                                                                        PassToken =
                                                  passtok;
                                                                                      });
                                                                                      if (State ==
                                                                                          201) {
                                                                                                                             
                                                                                        Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => MyApp(
                                                      title: firstnameg + lastnameg,
                                                      token: passtok,
                                                      userid: userid,
                                                    ),
                                                  ));
                                                                                      } else {
                                                                                        var snackBar =
                                                  SnackBar(
                                                                                          content: usercorrecion == null
                                                    ? const Text("something's wrong ")
                                                    : Text(usercorrecion.toString()),
                                                                                        );
                                                                    
                                                                                        // Find the ScaffoldMessenger in the widget tree
                                                                                        // and use it to show a SnackBar.
                                                                                        ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                                                                      }
                                                                                    }));
                                                                                              }
                                                                                                  // createAlbumX();
                                                                                                  );
                                                                                            },
                                                                                            child: Container(
                                                                                              height:
                                                                                                  getHdimention(
                                                                                  50),
                                                                                              width:
                                                                                                  getWdimention(
                                                                                  50),
                                                                                              decoration: BoxDecoration(
                                                                                                  color: Colors
                                                                                  .grey
                                                                                  .shade900,
                                                                                                  borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                          20.0)),
                                                                                              child: const Center(
                                                                                                  child: null),
                                                                                            ),
                                                                                          ),
                                                                                          const Padding(
                                                                                            padding:
                                                                                                EdgeInsets
                                                                                .all(8.0),
                                                                                          
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                Text(
                                                                                              "Log in using gmail",
                                                                                              style: GoogleFonts
                                                                                                  .lexend(
                                                                                                color:
                                                                                Colors.grey,
                                                                                                //backgroundColor: Colors.black,
                                                                                              ),
                                                                                            ),
                                                  ],),
                                                ),
                                              ),
                                            ),
                                          ),                         
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              );
                                                                                          });
                                                                                  
                                                                          },
                                                                        ),
                                                                      ],
                                                                          ),
                                                                      ListTile(
                                                                          title: Text(
                                                                              widget.title == "addaccount"?"Sign up for a new account":"We are thrilled to have you join our community.",
                                                                              style: GoogleFonts.rubik(
                                                                                  fontSize: 19,
                                                                                  color: Colors.grey))),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                width:
                                                                                    MediaQuery.of(context)
                              .size
                              .width *
                                                                                        .6,
                                                                                child: Padding(
                                                                                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                                                                  padding:
                                                                                      const EdgeInsets
                                                                                          .all(15.0),
                                                                                  child: TextField(
                                                                                    controller:
                                                                                        titleController4,
                                                                                    decoration:
                                                                                        InputDecoration(
                                                                                      //focusColor: Colors.red,
                                                                                      filled: true,
                                                                                      fillColor: Colors
                                                                                          .grey[900],
                                                                                      //fillColor: Colors.white,
                                                                                      border: OutlineInputBorder(
                                                                                          borderRadius:
                                BorderRadius
                                    .circular(
                                        10.0)),
                                                                                      //labelText: 'First name',
                                                                                      hintText:
                                                                                          'firstname',
                                                                                      hintStyle: const TextStyle(
                                                                                          color: Colors
                                .grey),
                                                                                    ),
                                                                                    style: const TextStyle(
                                                                                        color:
                              Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width:
                                                                                    MediaQuery.of(context)
                              .size
                              .width *
                                                                                        .4,
                                                                                child: Padding(
                                                                                  padding:
                                                                                      const EdgeInsets
                                                                                          .only(
                                                                                          left: 5.0,
                                                                                          right: 15.0,
                                                                                          top: 15,
                                                                                          bottom: 15.0),
                                                                                  child: TextField(
                                                                                    controller:
                                                                                        titleControllerv,
                                                                                    decoration:
                                                                                        InputDecoration(
                                                                                      filled: true,
                                                                                      fillColor: Colors
                                                                                          .grey[900],
                                                                                      //fillColor: Colors.white,
                                                                                      border: OutlineInputBorder(
                                                                                          borderRadius:
                                BorderRadius
                                    .circular(
                                        10.0)),
                                                                                      //labelText: 'Second name',
                                                                                      hintText:
                                                                                          'secondname',
                                                                                      hintStyle: const TextStyle(
                                                                                          color: Colors
                                .grey),
                                                                                    ),
                                                                                    style: const TextStyle(
                                                                                        color:
                              Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left: 15.0,
                                                                            right: 15.0,
                                                                            //top: 15,
                                                                            bottom: 0),
                                                                        //padding: EdgeInsets.symmetric(horizontal: 15),
                                                                        child: TextField(
                                                                          controller: titleController3,
                                                                          //obscureText: true,
                                                                          decoration: InputDecoration(
                                                                            filled: true,
                                                                            fillColor: Colors.grey[900],
                                                                            //fillColor: Colors.white,
                                                                            border: OutlineInputBorder(
                                                                                borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        10.0)),
                                                            
                                                                            //border: OutlineInputBorder(),
                                                                            //labelText: 'Email',
                                                                            hintText: 'Email',
                                                                            hintStyle: const TextStyle(
                                                                                color: Colors.grey),
                                                                          ),
                                                                          style: const TextStyle(
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left: 15.0,
                                                                            right: 15.0,
                                                                            top: 15,
                                                                            bottom: 0),
                                                                        //padding: EdgeInsets.symmetric(horizontal: 15),
                                                                        child: TextField(
                                                                          controller: titleController,
                                                                          //obscureText: true,createverification(titleController)
                                                                          decoration: InputDecoration(
                                                                            filled: true,
                                                                            fillColor: Colors.grey[900],
                                                                            //fillColor: Colors.white,
                                                                            border: OutlineInputBorder(
                                                                                borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        10.0)),
                                                            
                                                                            //border: OutlineInputBorder(),
                                                                            //labelText: 'Username',
                                                                            hintText: 'Username',
                                                                            hintStyle: const TextStyle(
                                                                                color: Colors.grey),
                                                                          ),
                                                                          style: const TextStyle(
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left: 15.0,
                                                                            top: 15.0,
                                                                            right: 15.0,
                                                                            bottom: 0),
                                                                        //padding: EdgeInsets.symmetric(horizontal: 15),
                                                                        child: 
                                                                        TextField(
                                                                          controller: titleController1,
                                                                          obscureText: obsc,
                                                                          decoration: InputDecoration(
                                                                            suffix: InkWell(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    obsc
                                                                                        ? obsc = false
                                                                                        : obsc = true;
                                                                                  });
                                                                                },
                                                                                child: !obsc
                                                                                    ? const Padding(
                                                                                        padding:
                              EdgeInsets
                                  .all(3.0),
                                                                                        child: Icon(
                              Ionicons
                                  .eye_outline,
                              size: 20,
                              color: Colors
                                  .white),
                                                                                      )
                                                                                    : const Padding(
                                                                                        padding:
                              EdgeInsets
                                  .all(3.0),
                                                                                        child: Icon(
                              Ionicons
                                  .eye_off_outline,
                              size: 20,
                              color: Colors
                                  .white),
                                                                                      )),
                                                                            filled: true,
                                                                            fillColor: Colors.grey[900],
                                                                            
                                                                            //fillColor: Colors.white,
                                                                            border: OutlineInputBorder(
                                                                                borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        10.0)),
                                                            
                                                                            //border: OutlineInputBorder(),
                                                                            //labelText: 'Password',
                                                                            hintText:
                                                                                'Enter secure x',
                                                                                
                                                                            hintStyle: const TextStyle(
                                                                                color: Colors.grey),
                                                                          ),
                                                                          style: const TextStyle(
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 30,
                                                                      ),
                                                                      Container(
                                                                        height: 50,
                                                                        width: 250,
                                                                        decoration: BoxDecoration(
                                                                            color: titleController.text ==
                                                                                        '' &&
                                                                                    titleController1
                              .text ==
                                                                                        ''
                                                                                ? Colors.red.shade100
                                                                                : Colors.red,
                                                                            borderRadius:
                                                                                BorderRadius.circular(
                                                                                    20)),
                                                                        child: TextButton(
                                                                          onPressed: () {
                                                                            
                                                                              create1()
                                                                                  .whenComplete(() async {
                                                                                final SharedPreferences
                                                                                    sharedPreferences =
                                                                                    await SharedPreferences
                                                                                        .getInstance();
                                                                                sharedPreferences
                                                                                    .setString(
                                                                                        'token',
                                                                                        passtok.toString());
                                                                                sharedPreferences
                                                                                    .setString(
                                                                                        'key',
                                                                                        userid.toString());
                                                           
                                                                                 //print("state here"+State.toString());
                                                                                if (State == 201) {
                                                                                  
                                                                                   audioCache.play(AssetSource('notification.mp3'));
                                                                                  showModalBottomSheet(
                                                                                    backgroundColor:
                                                                                        Colors.black,
                                                                                    // ignore: use_build_context_synchronously
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                   
                                                                                      return SizedBox(
                                                                                        child: Center(
                                                                                                                      child: Column(
                                                                                                                          mainAxisAlignment:
                                                                                                                              MainAxisAlignment
                                                                                                                                  .spaceEvenly,
                                                                                                                          children: [
                                                                                                                        ListTile(
                                                                                                                          subtitle:    Container(
                                                                                                                                                                  color: Colors.black
                                                                                                                                                                      .withOpacity(0.2),
                                                                                                                                                                  padding:
                                                                                                                                                                      const EdgeInsets.all(20.0),
                                                                                                                                                                  height: MediaQuery.of(context)
                                                                                                                                                                          .size
                                                                                                                                                                          .height *
                                                                                                                                                                      .1,
                                                                                                                                                                  width: MediaQuery.of(context)
                                                                                                                                                                      .size
                                                                                                                                                                      .width,
                                                                                                                                                                  child:  Center(
                                                                                                                                                                      child: Wrap(
                                                                                                                                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                                                                                                                                    children: [
                                                                                                                                                                      Text(
                                                                                                                                                                          "By Logging in, you are agreeing to our",
                                                                                                                                                                          textAlign: TextAlign.center,
                                                                                                                                                                          style: GoogleFonts
                                                                                                                                                                              .inconsolata(
                                                                                                                                                                            color:
                                                                                        Colors.grey,
                                                                                                                                                                            //backgroundColor: Colors.black,
                                                                                                                                                                          ),
                                                                                                                                                                        ),
                                                                                                                                                                     InkWell(
                                                                                                                                                                        onTap: () {
                                                                                                                                                                          Navigator.push(
                                                                                                                                                                            context,
                                                                                                                                                                            MaterialPageRoute(
                                                                                        builder: (context) =>
                                                                                                                      legal2(
                                                                                                                          darkmode:
                                                                                                                              false) //screen(),
                                                                                        ), //MaterialPageRoute
                                                                                                                                                                          );
                                                                                                                                                                        },
                                                                                                                                                                        child: Text(
                                                                                                                                                                          "Terms of Use",
                                                                                                                                                                           textAlign: TextAlign.center,
                                                                                                                                                                          style: GoogleFonts
                                                                                                                                                                              .inconsolata(
                                                                                                                                                                            color:
                                                                                        Colors.green,
                                                                                                                                                                            //backgroundColor: Colors.black,
                                                                                                                                                                          ),
                                                                                                                                                                        ),
                                                                                                                                                                      ),
                                                                                                                                                                      Text(
                                                                                                                                                                        " & ",
                                                                                                                                                                        style: GoogleFonts.lexend(
                                                                                                                                                                          color: Colors.grey,
                                                                                                                                                                          //backgroundColor: Colors.black,
                                                                                                                                                                        ),
                                                                                                                                                                      ),
                                                                                                                                                                      InkWell(
                                                                                                                                                                        onTap: () {
                                                                                                                                                                          Navigator.push(
                                                                                                                                                                            context,
                                                                                                                                                                            MaterialPageRoute(
                                                                                        builder: (context) =>
                                                                                                                      const legal1(
                                                                                                                          darkmode:
                                                                                                                              false) //screen(),
                                                                                        ), //MaterialPageRoute
                                                                                                                                                                          );
                                                                                                                                                                        },
                                                                                                                                                                        child: Text(
                                                                                                                                                                          "Policy",
                                                                                                                                                                           textAlign: TextAlign.center,
                                                                                                                                                                          style: GoogleFonts
                                                                                                                                                                              .inconsolata(
                                                                                                                                                                            color: Colors.cyan,
                                                                                                                                                                            //backgroundColor: Colors.black,
                                                                                                                                                                          ),
                                                                                                                                                                        ),
                                                                                                                                                                      )
                                                                                                                                                                    ],
                                                                                                                                                                  )))
                                                                                                                                                            ,
                                                                                                                          title: Text(
                                                                                                                              "User Account Created",
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: GoogleFonts.rubik(
                                                                                                                                  fontSize:
                                                                                                                                      20,
                                                                                                                                  color:
                                                                                                                                      Colors.white,
                                                                                                                                  fontWeight: FontWeight.normal)),
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          height:
                                                                                                                              50,
                                                                                                                          width:
                                                                                                                              250,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                              color: Colors
                                                                                                                                  .red,
                                                                                                                              borderRadius:
                                                                                                                                  BorderRadius.circular(10)),
                                                                                                                          child:
                                                                                                                              TextButton(
                                                                                                                            child:
                                                                                                                                const Text(
                                                                                                                              'Login',
                                                                                                                              style: TextStyle(
                                                                                                                                  color: Colors.white,
                                                                                                                                  fontSize: 25),
                                                                                                                            ),
                                                                                                                            onPressed:
                                                                                                                                () {
                                                                                                                              audioCache.play(AssetSource('notificationz.mp3'));
                                                                                                                        
                                                                                                                              setState(
                                                                                                                                  () {
                                                                                                                                createAlbum().whenComplete(() async {
                                                                                                                                  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                                                                                                                  sharedPreferences.setString('token', passtok);
                                                                                                                                  sharedPreferences.setString('key', userid);
                                                                                                                                  print(widget.title.toString()+"${passtok.toString()+ userid.toString()}");
                                                                                                                                  widget.title=="addaccount"?addaccount2(titleController.text,passtok.toString(),userid.toString()):"";
                                                                                                                                  widget.title=="addaccount"?addaccount(titleController.text):"";
                                                                                                                                
                                                                                                                                  setState(() {
                                                                                                                                    PassToken = passtok;
                                                                                                                                  });
                                                                                                                                  
                                                                                                                                  Navigator.push(
                                                                                                                                      // ignore: use_build_context_synchronously
                                                                                                                                      context,
                                                                                                                                      MaterialPageRoute(
                                                                                                                                        builder: (context) => MyApp(
                                                                                                                                          title:widget.title =="addaccount"? "addaccount":"newuser",
                                                                                                                                          token: passtok,
                                                                                                                                          userid: userid,
                                                                                                                                        ),
                                                                                                                                      ));
                                                                                                                                });
                                                                                                                              });
                                                                                                                                                    
                                                                                                                              //print(State);
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ])),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  var snackBar = SnackBar(
                                                                                    content: usercorrecion ==
                              null
                                                                                        ? const Text(
                              "something's wrong ")
                                                                                        : Text(usercorrecion
                              .toString()),
                                                                                  );
                                                            
                                                                                  // Find the ScaffoldMessenger in the widget tree
                                                                                  // and use it to show a SnackBar.
                                                                                  ScaffoldMessenger.of(
                                                                                          context)
                                                                                      .showSnackBar(
                                                                                          snackBar);
                                                            
                                                                                }
                                                                              
                                                                            });
                                                                          },
                                                                          child: const Text(
                                                                            "Continue",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const Text(
                                                                        '\nor',
                                                                        style: TextStyle(
                                                                            color: Colors.white),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.height*.1,
                                                                        width: 350,
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.black,
                                                                            borderRadius:
                                                                                BorderRadius.circular(
                                                                                    10)),
                                                                        child: TextButton(
                                                                          child: Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                              children: [
                                                                                 Text(
                                                                                  'Continue with ',//not this
                                                                                  style: GoogleFonts.rubik(
                                                                                  fontSize: 19,
                                                                                  color: Colors.grey)
                                                                                ),SizedBox(
                                                                                  //padding:EdgeInsets.all(20.0),
                                                                                  height: 60,
                                                                                  width:60 ,
                                                                                    child: Image.asset(
                                                                                        "assets/g2.png",
                                                                                        height: 80,
                                                                                        fit: BoxFit.cover,
                                                                                        width: 80,
                                                                                        scale: 12.0)),
                                                                                
                                                                              ]),
                                                                          onPressed: () {
                                                                            setState(() {
                                                                              _signInWithGoogle()
                                                                                  .whenComplete(() =>
                                                                                      create2()
                                                                                          .whenComplete(
                                () async {
                                                                                        final SharedPreferences
                              sharedPreferences =
                              await SharedPreferences
                                  .getInstance();
                                                                                        sharedPreferences
                              .setString(
                                  'token',
                                  passtok);
                                                                                        sharedPreferences
                              .setString(
                                  'key',
                                  userid);
                                                                                        setState(() {
                                                                                          PassToken =
                                passtok;
                                                                                        });
                                                                                        if (State ==
                              200) {
                                                                                           audioCache.play(AssetSource( 'notification.mp3'));
                                                                                          createpic();
                                                                                          showModalBottomSheet(
                              backgroundColor:
                                  Colors
                                      .black,
                              context:
                                  context,
                              builder:
                                  (context) {
                                return Container(
                                  child: Center(
                                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                    Text(
                                        "User Account Created",
                                        style: GoogleFonts.rubik(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white)),
                                    Container(
                                      height:
                                          50,
                                      width:
                                          250,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10)),
                                      child:
                                          TextButton(
                                        child:
                                            const Text(
                                          'Login',
                                          style: TextStyle(color: Colors.white, fontSize: 25),
                                        ),
                                        onPressed:
                                            () {
                                          audioCache.play(AssetSource('notificationz.mp3'));
                                          login7().whenComplete(() async {
                                            final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                            sharedPreferences.setString('token', passtok);
                                            sharedPreferences.setString('key', userid);
                                            setState(() {
                                              PassToken = passtok;
                                            });
                                            //change here
                                         // widget.title=="addaccount"?addaccount1(titleController
                                           //                                               .text):"";
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => MyApp(
                                                    title: widget.title == "addaccount"?"addaccount":titleController.text,
                                                    token: passtok,
                                                    userid: userid,
                                                  ),
                                                ));
                                          });
                                                            
                                          //print(State);
                                        },
                                      ),
                                    ),
                                  ])),
                                );
                              },
                                                                                          );
                                                                                        } else {
                                                                                          var snackBar =
                                SnackBar(
                              content: usercorrecion ==
                                      null
                                  ? const Text(
                                      "something's wrong ")
                                  : Text(usercorrecion
                                      .toString()),
                                                                                          );
                                                            
                                                                                          // Find the ScaffoldMessenger in the widget tree
                                                                                          // and use it to show a SnackBar.
                                                                                          ScaffoldMessenger.of(
                                    // ignore: use_build_context_synchronously
                                    context)
                                .showSnackBar(
                                    snackBar);
                                                            
                                                                                        }
                                                                                      }));
                                                                            }
                                                                                // createAlbumX();
                                                                                );
                                                                          },
                                                                        ),
                                                                      ),
                                                                     
                                                                      /*Container(
                                                                        height: MediaQuery.of(context).size.height*.09,
                                                                        width: getWdimention(350),
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.black,
                                                                            borderRadius:
                                                                                BorderRadius.circular(
                                                                                    10)),
                                                                        child: TextButton(
                                                                          child: const Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Log in',
                                                                                      style: TextStyle(
                                                                                        fontSize: 19.0,
                                                                                          color:
                                                                                              Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ]),
                                                                          onPressed: () {
                                                                               showModalBottomSheet(
                                                                                          isScrollControlled:
                                true,
                                                                                          context:
                                context,
                                                                                          builder:
                                (context) {
                              //  sum = 0;
                              //var given_list = [1, 2, 3, 4, 5];
                                                            
                              return Scaffold(
                                backgroundColor:
                                    Colors
                                        .grey
                                        .shade900,
                                body: Card(
                                  elevation:
                                      0,
                                  color: Colors
                                      .grey
                                      .shade900,
                                  child:
                                      SingleChildScrollView(
                                    child:
                                        Column(
                                      children: <Widget>[
                                        const ListTile(),
                                        AppBar(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            leading: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                titleController.clear();
                                              },
                                              child: const Icon(Icons.arrow_back, color: Colors.white),
                                            ),
                                            title: Text(
                                              "Log in", //amberlogin
                                              style: GoogleFonts.rubik(fontSize: 20, color: Colors.white),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.width * 0.20,
                                        ),
                                        Padding(
                                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: TextField(
                                            controller: titleController,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[900],
                                                //fillColor: Colors.white,
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                                labelText: 'Username',
                                                hintText: 'Enter your username'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                                          //padding: EdgeInsets.symmetric(horizontal: 15),
                                          child: TextField(
                                            style: const TextStyle(color: Colors.grey),
                                            controller: titleController1,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[900],
                                                //fillColor: Colors.white,
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                                            
                                                //border: OutlineInputBorder(),
                                                labelText: 'Password',
                                                hintText: 'Enter secure d'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.width * 0.20,
                                        ),
                                        Container(
                                          height: getHdimention(50),
                                          width: getWdimention(250),
                                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                                          child: TextButton(
                                            child: const Text(
                                              'Login',
                                              style: TextStyle(color: Colors.white, fontSize: 25),
                                            ),
                                            onPressed: () {
                                              createAlbum().whenComplete(() async {
                                                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                                sharedPreferences.setString('token', passtok.toString());
                                                sharedPreferences.setString('key', userid.toString());
                                                setState(() {
                                                  PassToken = passtok;
                                                });
                                                if (State == 200) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => MyApp(
                                                          title: titleController.text,
                                                          token: passtok,
                                                          userid: userid,
                                                        ),
                                                      ));
                                                  print('exis' + passtok);
                                                } else {
                                                  print('haiwork');
                                                  const snackBar = SnackBar(
                                                    content: Text("Please Try Again! There's an error with your credentials"),
                                                  );
                                                            
                                                  // Find the ScaffoldMessenger in the widget tree
                                                  // and use it to show a SnackBar.
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                              });
                                                            
                                              //print(State);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*.1,
                                          child:Text(
                                                                                              "\n  or  ",
                                                                                              style: GoogleFonts
                                                                                                  .lexend(
                                                                                                color:
                                                                                Colors.grey,
                                                                                                //backgroundColor: Colors.black,
                                                                                              ),
                                                                                            ),
                                        ),
                                          InkWell(
                                            onTap:() {
                                                setState(() {
                                                                                          logout();
                                                                                          _signInWithGoogle()
                                                                          .whenComplete(() =>
                                                                              login7().whenComplete(
                                                                                  () async {
                                                                                final SharedPreferences
                                                                                    sharedPreferences =
                                                                                    await SharedPreferences.getInstance();
                                                                                sharedPreferences.setString(
                                                                                    'token',
                                                                                    passtok);
                                                                                sharedPreferences.setString(
                                                                                    'key',
                                                                                    userid);
                                                                                setState(
                                                                                    () {
                                                                                  PassToken =
                                            passtok;
                                                                                });
                                                                                if (State ==
                                                                                    201) {
                                                                                  Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyApp(
                                                title: firstnameg + lastnameg,
                                                token: passtok,
                                                userid: userid,
                                              ),
                                            ));
                                                                                } else {
                                                                                  var snackBar =
                                            SnackBar(
                                                                                    content: usercorrecion == null
                                              ? const Text("something's wrong ")
                                              : Text(usercorrecion.toString()),
                                                                                  );
                                                              
                                                                                  // Find the ScaffoldMessenger in the widget tree
                                                                                  // and use it to show a SnackBar.
                                                                                  ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                                                                }
                                                                              }));
                                                                                        }
                                                                                            // createAlbumX();
                                                                                            );
                                            },
                                            child: ListTile(
                                                leading: Icon(
                                                                                                Ionicons
                                                                                .logo_google,
                                                                                                color:
                                                                                Colors.grey.shade900,
                                                                                              ),
                                              title: Center(
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Row(children: [
                                                      Column(
                                                                                        mainAxisAlignment:
                                                                                            MainAxisAlignment
                                                                                                .center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            onTap: () {
                                                                                              setState(() {
                                                                                                logout();
                                                                                                _signInWithGoogle()
                                                                                .whenComplete(() =>
                                                                                    login7().whenComplete(
                                                                                        () async {
                                                                                      final SharedPreferences
                                                                                          sharedPreferences =
                                                                                          await SharedPreferences.getInstance();
                                                                                      sharedPreferences.setString(
                                                                                          'token',
                                                                                          passtok);
                                                                                      sharedPreferences.setString(
                                                                                          'key',
                                                                                          userid);
                                                                                      setState(
                                                                                          () {
                                                                                        PassToken =
                                                  passtok;
                                                                                      });
                                                                                      if (State ==
                                                                                          201) {
                                                                                        Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => MyApp(
                                                      title: firstnameg + lastnameg,
                                                      token: passtok,
                                                      userid: userid,
                                                    ),
                                                  ));
                                                                                      } else {
                                                                                        var snackBar =
                                                  SnackBar(
                                                                                          content: usercorrecion == null
                                                    ? const Text("something's wrong ")
                                                    : Text(usercorrecion.toString()),
                                                                                        );
                                                                    
                                                                                        // Find the ScaffoldMessenger in the widget tree
                                                                                        // and use it to show a SnackBar.
                                                                                        ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                                                                      }
                                                                                    }));
                                                                                              }
                                                                                                  // createAlbumX();
                                                                                                  );
                                                                                            },
                                                                                            child: Container(
                                                                                              height:
                                                                                                  getHdimention(
                                                                                  50),
                                                                                              width:
                                                                                                  getWdimention(
                                                                                  50),
                                                                                              decoration: BoxDecoration(
                                                                                                  color: Colors
                                                                                  .grey
                                                                                  .shade900,
                                                                                                  borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                          20.0)),
                                                                                              child: const Center(
                                                                                                  child: null),
                                                                                            ),
                                                                                          ),
                                                                                          const Padding(
                                                                                            padding:
                                                                                                EdgeInsets
                                                                                .all(8.0),
                                                                                          
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                Text(
                                                                                              "Log in using gmail",
                                                                                              style: GoogleFonts
                                                                                                  .lexend(
                                                                                                color:
                                                                                Colors.grey,
                                                                                                //backgroundColor: Colors.black,
                                                                                              ),
                                                                                            ),
                                                  ],),
                                                ),
                                              ),
                                            ),
                                          ),                         
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              );
                                                                                          });
                                                                                  
                                                                          },
                                                                        ),
                                                                      ),
                                                                   
                                                                      InkWell(
                                                                          onTap: () {
                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) =>
                                                                                      const MyHomePage(
                                                                                          title:
                                "Buswise",
                                                                                          token:
                                "add25d964c89c4b325ec875d7dab92e8798dc983",
                                                                                          userid: "61"),
                                                                                ));
                                                                          },
                                                                          child: const Text(
                                                                            "Demo account",
                                                                            style: TextStyle(
                                                                                color: Colors.white),
                                                                          )),*/
                                                                      const SizedBox(height: 10),
                                                                      Container(
                                                                          color: Colors.black
                                                                              .withOpacity(0.2),
                                                                          padding:
                                                                              const EdgeInsets.all(20.0),
                                                                          height: MediaQuery.of(context)
                                                                                  .size
                                                                                  .height *
                                                                              .1,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          child:  const Center(
                                                                              child: Wrap(
                                                                            children: [
                                                                              
                                                                            /*  InkWell(
                                                                                onTap: () {
                                                                                  Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) =>
                              legal2(
                                  darkmode:
                                      false) //screen(),
                                                                                        ), //MaterialPageRoute
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  "Terms of Use",
                                                                                  style: GoogleFonts
                                                                                      .inconsolata(
                                                                                    color:
                                                                                        Colors.green,
                                                                                    //backgroundColor: Colors.black,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                " & ",
                                                                                style: GoogleFonts.lexend(
                                                                                  color: Colors.grey,
                                                                                  //backgroundColor: Colors.black,
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) =>
                              legal1(
                                  darkmode:
                                      false) //screen(),
                                                                                        ), //MaterialPageRoute
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  "Privacy Policy",
                                                                                  style: GoogleFonts
                                                                                      .inconsolata(
                                                                                    color: Colors.cyan,
                                                                                    //backgroundColor: Colors.black,
                                                                                  ),
                                                                                ),
                                                                              )*/
                                                                            ],
                                                                          )))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                              );
                            });
                      }),
                      child: Text(
                        widget.title == "addaccount"
                            //there's no actual reason for this ... i just did it because it was a direct copy from buswise app login
                            ? "Continue"
                            : "Get Started", //changed
                        style: GoogleFonts.montserrat(
                            fontSize: 20, color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.25,
              ),
              Container(
                color: Colors.black.withOpacity(0.8),
                //height: 50,
                child: Center(
                  child: Text(
                    "Freshfit",
                    style: GoogleFonts.inconsolata(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: getHdimention(20)),
              /*Center(
                  child: Wrap(children: [
                Text("By Signing in to our app, you are agreeing to our "),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                legal2(darkmode: false) //screen(),
                            ), //MaterialPageRoute
                      );
                    },
                    child: Text(
                      "terms and conditions",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          //fontSize: 20,
                          color: Colors.green),
                    ))
              ]))*/
            ]),
          ),
        ),
      ),
    ]));
  }
}
