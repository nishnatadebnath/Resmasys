import 'package:flutter/material.dart';

class App_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0XFF00B2FF),
      shadowColor: Color(0X0000B2FF),
      title: Image(
        image: AssetImage('assets/graphe_symbol.png'),
      ),
      actions: [
        Image(
          image: AssetImage('assets/notifications.png'),
        ),
      ],
    );
  }
}
