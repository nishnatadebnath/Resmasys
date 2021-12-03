import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/const.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/pages/OrderStatusPage.dart';
import 'package:flutter_app/cartData.dart';
import 'FoodDetailsPage.dart';
import 'package:flutter_app/firebase_func.dart';

class FoodOrderPage extends StatefulWidget {
  @override
  _FoodOrderPageState createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  int counter = 3;
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  List<int> cart_indexes = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < Global_var.cart.length; i++) {
      if (Global_var.cart[i].quantity > 0) {
        cart_indexes.add(i);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF3a3737),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Center(
            child: Text(
              "Item Carts",
              style: TextStyle(
                  color: Color(0xFF3a3737),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          brightness: Brightness.light,
          actions: <Widget>[
            CartIconWithBadge(),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 650,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Your Food Cart",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: PopularFoodItems(),
                ),
                SizedBox(
                  height: 10,
                ),

                PromoCodeWidget(),
                SizedBox(
                  height: 10,
                ),
                //TotalCalculationWidget(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Firebase_Func.addOrdersToOngoingOrders(
                          databaseReference, cart_indexes);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderStatusPage()),
                      );
                    },
                    child: Container(
                      width: 100.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFfd2c2c),
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          'Place order!',
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void AddToFirebase() {
    var dateTime = DateTime.now();
    final FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;

    databaseReference
        .child("Ongoing Orders")
        .child(dateTime.millisecondsSinceEpoch.toString())
        .set({
      'item': 'Burger',
      'quantity': Global_var.cart_list[0].toString(),
      'status': 'Preparing',
      'tableNo': '10',
    });
    databaseReference
        .child("Customer Details")
        .child(user.uid.toString())
        .child("orders")
        .push()
        .set({
      dateTime.millisecondsSinceEpoch.toString(): 'true',
    });
  }
}

// class PaymentMethodWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       width: double.infinity,
//       height: 60,
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           color: Color(0xFFfae3e2).withOpacity(0.1),
//           spreadRadius: 1,
//           blurRadius: 1,
//           offset: Offset(0, 1),
//         ),
//       ]),
//       child: Card(
//         color: Colors.white,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: const BorderRadius.all(
//             Radius.circular(5.0),
//           ),
//         ),
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   "assets/images/menus/ic_credit_card.png",
//                   width: 50,
//                   height: 50,
//                 ),
//               ),
//               Text(
//                 "Credit/Debit Card",
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: Color(0xFF3a3a3b),
//                     fontWeight: FontWeight.w400),
//                 textAlign: TextAlign.left,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class TotalCalculationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Fried Rice",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    Global_var.item_price[0].toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    (Global_var.cart_list[0] * Global_var.item_price[0])
                        .toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PromoCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: TextFormField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
                  borderRadius: BorderRadius.circular(7)),
              fillColor: Colors.white,
              hintText: 'Add instructions',
              filled: true,
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.local_offer,
                    color: Color(0xFFfd2c2c),
                  ),
                  onPressed: () {
                    debugPrint('222');
                  })),
        ),
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
    return Visibility(
      visible: true,
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
                          'Quantity : ' +
                              Global_var.cart[index].quantity.toString(),
                          style:
                              kTextStyleGrey(weight: FontWeight.w600, size: 12),
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
                      child: Center(
                        child: Text(
                          '₹' +
                              ((int.parse(Global_var
                                          .cart[index].data.priceOfItem)) *
                                      Global_var.cart[index].quantity)
                                  .toString(),
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
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
        ],
      ),
    );
  }
}

class CartIconWithBadge extends StatelessWidget {
  int counter = 3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.business_center,
              color: Color(0xFF3a3737),
            ),
            onPressed: () {}),
        counter != 0
            ? Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}

class PopularFoodItems extends StatefulWidget {
  @override
  _PopularFoodItemsState createState() => _PopularFoodItemsState();
}

class _PopularFoodItemsState extends State<PopularFoodItems> {
  Query _ref;
  List<int> cart_indexes = [];
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < Global_var.cart.length; i++) {
      if (Global_var.cart[i].quantity > 0) {
        cart_indexes.add(i);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Global_var.cart.length == 0
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.purple,
          ))
        : ListView.builder(
            itemCount: cart_indexes.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  foodItemCardUI(
                    menuDataItem: Global_var.cart[cart_indexes[index]],
                    index: cart_indexes[index],
                  ),
                  SizedBox(
                    height: 0,
                  )
                ],
              );
            }));
  }
}
