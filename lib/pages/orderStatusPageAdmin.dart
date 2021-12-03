import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/const.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/Data.dart' as Dt;
import 'status_display_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderStatusPageAdmin extends StatefulWidget {
  OrderStatusPageAdmin({Key key}) : super(key: key);

  @override
  _OrderStatusPageStateAdmin createState() => _OrderStatusPageStateAdmin();
}

class _OrderStatusPageStateAdmin extends State<OrderStatusPageAdmin> {
  List<Dt.Data> dataList = [];
  List<String> orders = [];
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("Ongoing Orders");

    referenceData.once().then(
      (DataSnapshot dataSnapShot) {
        dataList.clear();
        var keys = dataSnapShot.value.keys;
        var values = dataSnapShot.value;
        for (var key in keys) {
          Dt.Data data = new Dt.Data(
            key,
            values[key]["item"],
            values[key]["quantity"],
            values[key]["status"],
            values[key]["tableNo"],
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

    //print(user.uid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: dataList.length == 0
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ))
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    CardUI(dataList[index].item, dataList[index].quantity,
                        dataList[index].status, dataList[index].key),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ),
    );
  }

  Widget CardUI(String item, String quantity, String status, String orderId) {
    int pointer = 0;
    if (status == 'Served') pointer = 2;
    if (status == 'Cooked') pointer = 1;

    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              // Container(
              //     padding: EdgeInsets.all(5),
              //     height: 70,
              //     width: 70,
              //     child: Image.network(
              //         'https://www.designindaba.com/sites/default/files/styles/scaledlarge/public/node/news/23566/sonic-burger.jpg?itok=zGk5pjcI')),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                item,
                                style: kTextStyleBlack(
                                    weight: FontWeight.w600, size: 24),
                              ),
                            ),
                            Text(
                              'x' + quantity,
                              style: kTextStyleBlack(
                                  weight: FontWeight.w400, size: 18),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Transaction Number:' + orderId,
                        style:
                            kTextStyleGrey(size: 12, weight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            //indent: 20,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.my_location,
                color: Colors.red,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => status_bar(
                              currentPosition: pointer,
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Track Status',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
