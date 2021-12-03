import 'package:flutter/material.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/pages/FoodOrderPage.dart';
import 'package:flutter_app/widgets/FoodDetailsSlider.dart';
//import 'package:flutter_cart/flutter_cart.dart' as crt;
import 'package:flutter_app/const.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:flutter_app/menuData.dart';
import 'package:timeline_status/timeline_status.dart';

class FoodDetailsPage extends StatefulWidget {
  FoodDetailsPage({
    @required this.itemDetails,
  });
  final menuData itemDetails;

  @override
  _FoodDetailsPageState createState() =>
      _FoodDetailsPageState(itemDetails: itemDetails);
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  _FoodDetailsPageState({
    @required this.itemDetails,
  });

  final menuData itemDetails;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
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
          brightness: Brightness.light,
          actions: <Widget>[CartIconWithBadge()],
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                      width: double.infinity,
                      child: Image.network(itemDetails.image)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(15),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FoodTitleWidget(
                      productName: itemDetails.nameOfItem,
                      productPrice: itemDetails.priceOfItem,
                      productHost: itemDetails.uidItem),
                ),
              ),
              // AddToCartMenu(),
              PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: TabBar(
                  labelColor: Color(0xFFfd3f40),
                  indicatorColor: Color(0xFFfd3f40),
                  unselectedLabelColor: Color(0xFFa4a1a1),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    Tab(
                      text: 'Food Details',
                    ),
                    Tab(
                      text: 'Food Reviews',
                    ),
                  ], // list of tabs
                ),
              ),
              Container(
                height: 150,
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.white24,
                      child: DetailContentMenu(),
                    ),
                    Container(
                      color: Colors.white24,
                      child: DetailContentMenu(),
                    ), // class name
                  ],
                ),
              ),
              BottomMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodTitleWidget extends StatelessWidget {
  String productName;
  String productPrice;
  String productHost;

  FoodTitleWidget({
    Key key,
    @required this.productName,
    @required this.productPrice,
    @required this.productHost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              productName,
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "₹" + productPrice,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Text(
              "  #" + productHost,
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFA39F9F),
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                FlutterWebBrowser.openWebPage(
                  url:
                      "https://console.echoar.xyz/webar?key=frosty-bar-7986&entry=a2d74d9a-535f-4bd6-ae67-d98404cd8ac9",
                  customTabsOptions: CustomTabsOptions(
                    colorScheme: CustomTabsColorScheme.dark,
                    toolbarColor: Color(0xFFFFFF),
                    secondaryToolbarColor: Colors.green,
                    navigationBarColor: Colors.amber,
                    addDefaultShareMenuItem: false,
                    instantAppsEnabled: true,
                    showTitle: false,
                    urlBarHidingEnabled: true,
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.threed_rotation,
                    color: Color(0xFF404aff),
                    size: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "See your food in 3D",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1,
            color: Colors.grey,
            height: 70,
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.whatshot,
                  color: Color(0xFFff0654),
                  size: 35,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "360",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Cal per serve",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFa9a9a9),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            color: Colors.grey,
            height: 70,
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.timelapse,
                  color: Color(0xFF23c58a),
                  size: 35,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "20",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Estimated wait-time",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFa9a9a9),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // Column(
          //   children: <Widget>[
          //     Icon(
          //       Icons.directions_bike,
          //       color: Color(0xFFe95959),
          //       size: 35,
          //     ),
          //     SizedBox(
          //       height: 15,
          //     ),
          //     Text(
          //       "Delivery",
          //       style: TextStyle(
          //           fontSize: 14,
          //           color: Color(0xFFa9a9a9),
          //           fontWeight: FontWeight.w300),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}

class AddToCartMenu extends StatefulWidget {
  @override
  _AddToCartMenuState createState() => _AddToCartMenuState();
}

class _AddToCartMenuState extends State<AddToCartMenu> {
  // @override
  @override
  Widget build(BuildContext context) {
//var cart = crt.FlutterCart();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (Global_var.cart_list[0] > 0) {
                  Global_var.cart_list[0]--;
                }
              });
            },
            icon: Icon(Icons.remove),
            color: Colors.red,
            iconSize: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, ScaleRoute(page: FoodOrderPage()));
            },
            child: Container(
              width: 80.0,
              height: 45.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  (Global_var.cart_list[0] == 0)
                      ? "0"
                      : Global_var.cart_list[0].toString(),
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                //if (Global_var.cart_list[0] == 0) {
                Global_var.cart_list[0]++;

                print(Global_var.cart_list[0]);
              });
            },
            icon: Icon(Icons.add),
            color: Color(0xFFfd2c2c),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}

class DetailContentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'With spices and other secret ingredients, these turkey, chicken, vegetarian, and spruced-up beef patties take your everyday burger to new heights.',
        style: TextStyle(
            fontSize: 14.0,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            height: 1.50),
        textAlign: TextAlign.justify,
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
