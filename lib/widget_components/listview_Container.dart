import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../const.dart';

class Listview_container extends StatefulWidget {
  const Listview_container(String this.keyID, this.item, String this.status);
  final String keyID;
  final String item;
  final String status;

  @override
  _Listview_containerState createState() => _Listview_containerState();
}

class _Listview_containerState extends State<Listview_container> {
  var databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 25, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kgreyprofile,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.item,
                    style: kTextStyleGrey(
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.status,
              style: kTextStyleBlack(
                size: 14,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text(
            'Change order status for #' + widget.keyID,
            style: kTextStyleBlack(
              size: 24,
              weight: FontWeight.bold,
            ),
          ),
          content: Container(
            height: 140.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      _updateStatus("Preparing");
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      new Icon(
                        Icons.fiber_manual_record_outlined,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: new Text(
                          'Preparing',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 0.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _updateStatus("Cooked");
                      Navigator.pop(context);
                    });
                  },
                  child: new Row(
                    children: <Widget>[
                      new Icon(
                        Icons.fiber_manual_record_outlined,
                        color: Colors.yellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: new Text(
                          'Cooked',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 0.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _updateStatus("Served");
                      Navigator.pop(context);
                    });
                  },
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.fiber_manual_record_outlined,
                          color: Colors.green),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: new Text(
                          'Served',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateStatus(String s) {
    databaseReference
        .child("Ongoing Orders")
        .child(widget.keyID)
        .update({'status': s});
  }
}
