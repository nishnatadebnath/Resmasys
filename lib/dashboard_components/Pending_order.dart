import 'package:flutter/material.dart';
import 'package:flutter_app/widget_components/reusable_card.dart';
import 'package:flutter_app/widget_components/icon_content.dart';
import 'package:flutter_app/pages/orderStatusPageAdmin.dart';

class pending_orders extends StatelessWidget {
  const pending_orders({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderStatusPageAdmin()),
        );
      },
      child: ReusableCard(
        colour: Colors.white,
        card_height: 100,
        cardChild: IconContent(
          label: 'Pending\norders',
          icon: 'person',
          sublabel: '(+11)',
          circleColour: Color(0x0D713BDB),
        ),
      ),
    );
  }
}
