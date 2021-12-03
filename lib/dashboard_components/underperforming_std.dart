import 'package:flutter/material.dart';
import 'package:flutter_app/widget_components/reusable_card.dart';
import 'package:flutter_app/widget_components/icon_content.dart';
import 'package:flutter_app/pages/edit_menu.dart';

class Underperforming_card extends StatelessWidget {
  const Underperforming_card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditMenuPage()),
        );
      },
      colour: Colors.white,
      card_height: 100,
      cardChild: IconContent(
        label: 'Takeaway\nOrders',
        icon: 'person',
        sublabel: '(+9)',
        circleColour: Color(0x0DFF4C61),
      ),
    );
  }
}
