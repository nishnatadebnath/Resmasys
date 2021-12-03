import 'package:flutter/material.dart';

import 'package:flutter_app/widget_components/reusable_card.dart';
import 'package:flutter_app/widget_components/icon_content.dart';

class Issues extends StatelessWidget {
  const Issues({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: Colors.white,
      card_height: 100,
      cardChild: IconContent(
        label: 'Issues',
        icon: 'mark',
        sublabel: '',
        circleColour: Color(0x1233D69F),
      ),
    );
  }
}
