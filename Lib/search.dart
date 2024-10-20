import 'package:flutter/material.dart';
import 'menu.dart';

class searchQ extends StatefulWidget {
  searchQ(
      {Key? key,
      required this.misearch,
      required this.username,
      required this.firstname,
      required this.id,
      required this.geolocation,
      required this.token
      
      })
      : super(key: key);
  List misearch;
  String username;
  String geolocation;
  String firstname;
  String id;
  
  String token;
  @override
  State<searchQ> createState() => _searchQState();
}

class _searchQState extends State<searchQ> {
  final titleController = TextEditingController();
  List ronox = [];

  /* */
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List rono = widget.misearch;
    bool woz = true; //yea i was listening to steve wozniak

    void sq(List x) {
      setState(() => ronox = x);
      print(ronox);

      //rono was here 5/20/22~2:29am
    }

    @override
    void initState() {
      super.initState();
      titleController.text = '';
      print('search bar' + titleController.text);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0), // here the desired height
          child: AppBar(
            //backgroundColor: Colors.white,
        
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: Container(),
            centerTitle: true,
            flexibleSpace: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        onTap: () {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['username'].toLowerCase().contains(''),
                                //print(x);
                              )
                              .toList());
                        },
                        //actions:[],
                        onChanged: (text) {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['username']
                                    .toLowerCase()
                                    .contains(text.toLowerCase()),
                                //print(x);
                              )
                              .toList());

                          print("can't get this" + rono.toString());
                        },
                        autofocus: false,
                        controller: titleController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: woz
                                ? InkWell(
                                    child: Icon(Icons.close),
                                    onTap: () {
                                      //woz = true;

                                      titleController.clear();
                                      titleController.text = '';
                                      print('was here');
                                    },
                                  )
                                : Container(),
                            filled: true,
                            fillColor: Colors.grey[100],
                            //fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                            //labelText: 'Search',
                            hintText: 'Search for restaurants'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: ronox != ''
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    //Text('xcd' + ronox.toString()),
                    ...ronox.map((i) => ListTile(
                          onTap: () {
                           
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Rutimetable(
                                    title: (rono.indexOf(i) + 1).toString(),
                                    token: widget.token.toString(),
                                    geolocation: widget.geolocation,
                                    user: "Menu",
                                    me: widget.username
                                        .toString(),
                                    id: widget.id,
                                    firstname: widget.firstname,   
                                        
                                        ), // sky2['username']
                              ),
                            );
                          },
                          leading: InkWell(
                              child: Container(
                                height: 48.5,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          10.0) //                 <--- border radius here
                                      ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        i['image_of_restaurant'].toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: null /* add child content here */,
                              ),
                              onTap: () {}),
                          subtitle: Text(
                            "${i['location']}",
                            style: TextStyle(color: Colors.black),
                          ),
                          title: Text(
                            "${i['username']}",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.yellow[700],
                              child: Center(
                                  child: RotatedBox(
                                      quarterTurns: 90,
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        size: 12,
                                        color: Colors.white,
                                      )))),
                        )),
                  ],
                ),
              )
            : Scaffold(
                body: Column(
                children: [
                  ...rono.take(6).map((c) => ListTile(
                        title: Text('${c}'),
                      )),
                ],
              )));
  }
}
