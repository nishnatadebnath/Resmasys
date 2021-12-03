import '../const.dart';
import 'package:flutter/material.dart';
import '../widget_components/reusable_card.dart';
import '../widget_components/listview_Container.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/Data.dart' as Dt;

class Pending_order_status extends StatefulWidget {
  const Pending_order_status({
    Key key,
  }) : super(key: key);

  @override
  _Pending_order_statusState createState() => _Pending_order_statusState();
}

class _Pending_order_statusState extends State<Pending_order_status> {
  List<Dt.Data> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("Ongoing Orders");
    referenceData.once().then((DataSnapshot dataSnapShot) {
      dataList.clear();
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;
      for (var key in keys) {
        // if (values[key]["status"] == "Preparing" ||
        //     values[key]["status"] == "Cooked") {
        Dt.Data data = new Dt.Data(
          key,
          values[key]["item"],
          values[key]["quantity"],
          values[key]["status"],
          values[key]["tableNo"],
        );
        //print(values[key]["item"]);
        dataList.add(data);
        //}
      }
      setState(() {
        //
      });
    });

    return Row(
      children: [
        Expanded(
          child: ReusableCard(
            card_height: 260,
            colour: Colors.white,
            cardChild: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pending Orders',
                          style: kTextStyleBlack(
                              size: 16, weight: FontWeight.w600)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                print('pressed');
                                //
                              });
                            },
                            child: Text(
                              'Press to change status',
                              style: kTextStyleGrey(
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.1,
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  color: Color(0xFFEEF0F6),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (_, index) {
                      return Listview_container(dataList[index].key,
                          dataList[index].item, dataList[index].status);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
