import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

//void main() => runApp(MyshopL());

class MyshopL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ShoppingListPage(
        title: false,
      ),
    );
  }
}

class ShoppingListPage extends StatefulWidget {
  ShoppingListPage({Key? key,
      required this.title,
  }): super(key: key);
  final bool title;
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState(
    
  );
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<String> _shoppingList = [];

  @override
  void initState() {
    super.initState();
    _loadShoppingList();
  }

  _loadShoppingList() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _shoppingList = prefs.getStringList('shopping_list') ?? [];
    });
  }

  _saveShoppingList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('shopping_list', _shoppingList);
  }

  @override
  void dispose() {
    _saveShoppingList();
    super.dispose();
  }

  void _addItem(String item) {
    setState(() {
      _shoppingList.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: widget.title?Colors.black:Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: widget.title?Colors.white:Colors.black,)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Shopping List',style: GoogleFonts.lato(color: !widget.title?Colors.black:Colors.white),),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _shoppingList.length,
          itemBuilder: (context, index) {
            final item = _shoppingList[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  _shoppingList.removeAt(index);
                });
              },
              child:Card( 
                color: Colors.transparent,
                elevation: 0,
              child:Column(children: [
              ListTile(
                //tileColor: Colors.green.withOpacity(0.4),
                leading: 
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 12,
                  child: Center(child: Text((_shoppingList.indexOf(item)+1).toString()))),
                title: Text(item,
                                      style: GoogleFonts.lato(
                                          fontSize: 19,
                                          color: !widget.title?Colors.black:Colors.white,
                                          //fontWeight: FontWeight.bold
                                          
                                          ),),
              //  subtitle: Text(""),
              ),
              SizedBox(height: 10,),
              Container(height: 0.07,
              color: !widget.title?Colors.black:Colors.white,
              width: MediaQuery.of(context).size.width*.9,
              )
              ])));
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Center(child: Text("Swipe to remove a product",style: TextStyle(color: !widget.title?Colors.black:Colors.white),))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: 
                   Colors.green,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final itemController = TextEditingController();
              return AlertDialog(
                backgroundColor: widget.title?Colors.grey.shade900:Colors.grey.shade100,
                title: Text('Add Item',style: GoogleFonts.lato(color:!widget.title?Colors.black:Colors.white,),),
                content: TextField(
                  controller: itemController,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      _addItem(itemController.text);
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
                    );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}




