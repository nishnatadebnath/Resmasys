import 'package:flutter/material.dart';
import 'package:flutter_app/const.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label, this.circleColour, this.sublabel});

  final String icon;
  final String label;
  final Color circleColour;
  final String sublabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 18,
          backgroundColor: circleColour,
          child: Image(
            image: AssetImage('assets/$icon.png'),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: kTextStyleBlack(
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                sublabel,
                textAlign: TextAlign.center,
                style: kTextStyleGrey(
                  size: 11,
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
