import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/const.dart';
import 'package:flutter_app/firebase_func.dart';
import 'package:flutter_app/menuData.dart';

TextEditingController itemNameController = new TextEditingController();
TextEditingController itemPriceController = new TextEditingController();
TextEditingController itemDescriptionController = new TextEditingController();
TextEditingController itemImageController = new TextEditingController();

class addToMenuPage extends StatefulWidget {
  @override
  _addToMenuPageState createState() => _addToMenuPageState();
}

class _addToMenuPageState extends State<addToMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbluecolor,
        shadowColor: kbluecolor,
        title: Text(
          'Add items',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height / 4.8,
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [kbluecolor, Color(0xFFCEE8F5)],
            //       ),
            //       borderRadius:
            //           BorderRadius.only(bottomLeft: Radius.circular(90))),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Align(
            //         alignment: Alignment.center,
            //         child: Icon(
            //           Icons.person,
            //           size: 90,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    // width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: itemNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Item Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: itemPriceController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Item Price',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // width: MediaQuery.of(context).size.width / 1.2,
                    height: 135,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: itemDescriptionController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Item Description',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: itemImageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Item Image URL',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: GestureDetector(
                      onTap: () {
                        menuData data = new menuData(
                          priceOfItem: itemPriceController.text,
                          image: itemImageController.text,
                          nameOfItem: itemNameController.text,
                          description: itemDescriptionController.text,
                        );
                        var databaseReference =
                            FirebaseDatabase.instance.reference();
                        Firebase_Func.addItemToMenu(databaseReference, data);
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF77589E),
                                Color(0xFF89679C),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'Add to menu',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
