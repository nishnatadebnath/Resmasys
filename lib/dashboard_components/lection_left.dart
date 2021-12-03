import 'package:flutter/material.dart';
import 'package:flutter_app/widget_components/reusable_card.dart';
import 'package:flutter_app/widget_components/icon_content.dart';

class RevenueStats extends StatelessWidget {
  const RevenueStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: Colors.white,
      card_height: 100,
      cardChild: IconContent(
        label: 'Revenue\nStatistics',
        icon: 'cup',
        sublabel: '+₹1040',
        circleColour: Color(0x12FFB800),
      ),
    );
  }
}
