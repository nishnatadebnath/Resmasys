import 'package:flutter/material.dart';
import 'package:flutter_app/pages/FoodDetailsPage.dart';
import 'package:flutter_app/pages/FoodOrderPage.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/OrderStatusPage.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:flutter_app/pages/dashbord.dart';
import 'package:flutter_app/pages/orderStatusPageAdmin.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            OrderStatusPageAdmin(),
            FoodOrderPage(),
            HomePage(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 15.0),
            indicatorColor: Colors.transparent,
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, size: 24),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.gps_not_fixed, size: 18),
                text: 'Order \nstatus',
              ),
              Tab(
                icon: Icon(Icons.card_travel, size: 24),
                text: 'Cart',
              ),
              Tab(
                icon: Icon(Icons.person_outline, size: 24),
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
