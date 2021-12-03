import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_func.dart';
import 'package:flutter_app/menuData.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/const.dart';
import 'package:timeline_status/timeline_status.dart';
import 'AddToMenuPage.dart';

List<menuData> dataList = [];

class EditMenuPage extends StatefulWidget {
  @override
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbluecolor,
        shadowColor: kbluecolor,
        title: Text(
          'Edit Menu',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '[ Click on any item to edit or delete ]',
              style: kTextStyleGrey(size: 14, weight: FontWeight.w600),
            ),
          ),
          Expanded(child: menuWidget()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addToMenuPage()),
          );
        },
      ),
    );
  }
}

class foodItemCardUI extends StatefulWidget {
  const foodItemCardUI({
    Key key,
    // @required this.rating,
    // @required this.numberOfRating,
    this.menuDataItem,
  }) : super(key: key);

  // final String rating;
  // final String numberOfRating;
  final menuData menuDataItem;

  @override
  _foodItemCardUIState createState() => _foodItemCardUIState();
}

class _foodItemCardUIState extends State<foodItemCardUI> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 12, 5, 12),
        width: double.infinity,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.menuDataItem.image,
                          ),
                          fit: BoxFit.fill),
                    ),
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 14, top: 0),
                    child: Text(widget.menuDataItem.nameOfItem,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 10, 10),
                    child: SizedBox(
                      width: 180,
                      child: Text(
                        '[ ' + widget.menuDataItem.description + ' ]',
                        style:
                            kTextStyleGrey(weight: FontWeight.w600, size: 10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  new Spacer(),
                  Container(
                      padding: EdgeInsets.only(left: 0, top: 0, right: 0),
                      child: Text(
                        '₹' + widget.menuDataItem.priceOfItem,
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  new Spacer()
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                var databaseReference = FirebaseDatabase.instance.reference();
                print(widget.menuDataItem.uidItem);
                Firebase_Func.deleteItemFromMenu(
                    databaseReference, widget.menuDataItem.uidItem);
                setState(() {});
              },
              child: Container(
                child: Icon(
                  Icons.delete,
                  color: redAccent,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class menuWidget extends StatefulWidget {
  @override
  _menuWidgetState createState() => _menuWidgetState();
}

class _menuWidgetState extends State<menuWidget> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child('Menu');

    referenceData.once().then(
      (DataSnapshot dataSnapShot) {
        dataList.clear();
        var keys = dataSnapShot.value.keys;
        var values = dataSnapShot.value;
        for (var key in keys) {
          print(key);
          menuData data = new menuData(
            nameOfItem: values[key]["name"],
            priceOfItem: values[key]["price"],
            description: values[key]["description"],
            image: values[key]["image"],
            uidItem: key,
          );
          dataList.add(data);
        }

        setState(
          () {
            //
          },
        );
      },
    );
    return (dataList.length == 0
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.purple,
          ))
        : ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  foodItemCardUI(
                    menuDataItem: dataList[index],
                  ),
                  SizedBox(
                    height: 0,
                  )
                ],
              );
            },
          ));
  }
}
