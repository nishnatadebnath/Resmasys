import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/animation/RotationRoute.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/const.dart';
import 'package:flutter_app/pages/FoodDetailsPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/menuData.dart';
import 'package:timeline_status/timeline_status.dart';
import 'package:flutter_app/cartData.dart';

List<menuData> dataList = [];

class PopularFoodsWidget extends StatefulWidget {
  @override
  _PopularFoodsWidgetState createState() => _PopularFoodsWidgetState();
}

class _PopularFoodsWidgetState extends State<PopularFoodsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          PopularFoodTitle(),
          Expanded(
            child: PopularFoodItems(),
          )
        ],
      ),
    );
  }
}

class foodItemCardUI extends StatelessWidget {
  const foodItemCardUI({
    Key key,
    // @required this.rating,
    // @required this.numberOfRating,
    this.menuDataItem,
    this.index,
  }) : super(key: key);

  // final String rating;
  // final String numberOfRating;
  final CartData menuDataItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoodDetailsPage(
                    itemDetails: menuDataItem.data,
                  )),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Container(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              menuDataItem.data.image,
                            ),
                            fit: BoxFit.fill),
                      ),
                      height: 80,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 14, top: 0),
                      child: Text(menuDataItem.data.nameOfItem,
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
                          '[ ' + menuDataItem.data.description + ' ]',
                          style:
                              kTextStyleGrey(weight: FontWeight.w600, size: 10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 0, top: 0, right: 0),
                        child: Text(
                          '₹' + menuDataItem.data.priceOfItem,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    AddToCartMenu(
                      index: index,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Popluar Foods",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
          Text(
            "See all",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}

class PopularFoodItems extends StatefulWidget {
  @override
  _PopularFoodItemsState createState() => _PopularFoodItemsState();
}

class _PopularFoodItemsState extends State<PopularFoodItems> {
  Query _ref;

  @override
  void initState() {
    print("heyeee");
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child('Menu');

    referenceData.once().then(
      (DataSnapshot dataSnapShot) {
        dataList.clear();
        var keys = dataSnapShot.value.keys;
        var values = dataSnapShot.value;
        for (var key in keys) {
          menuData data = new menuData(
            nameOfItem: values[key]["name"],
            priceOfItem: values[key]["price"],
            description: values[key]["description"],
            image: values[key]["image"],
            uidItem: key,
          );
          dataList.add(data);

          Global_var.cart.add(CartData(data: data, quantity: 0));
        }

        setState(
          () {
            //
          },
        );
      },
    );
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    menuDataItem: Global_var.cart[index],
                    index: index,
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

class AddToCartMenu extends StatefulWidget {
  AddToCartMenu({this.index});

  int index;
  @override
  _AddToCartMenuState createState() => _AddToCartMenuState(index: index);
}

class _AddToCartMenuState extends State<AddToCartMenu> {
  _AddToCartMenuState({this.index});

  int index;

  // @override
  @override
  Widget build(BuildContext context) {
//var cart = crt.FlutterCart();
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if (Global_var.cart[index].quantity > 0) {
                  Global_var.cart[index].quantity--;

                  setState(() {});
                }
              },
              child: Container(
                child: Icon(
                  Icons.remove,
                  color: redAccent,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                child: Center(
                  child: Text(
                    Global_var.cart[index].quantity.toString(),
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Global_var.cart[index].quantity++;
                setState(() {});
              },
              child: Container(
                child: Icon(
                  Icons.add,
                  color: redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
