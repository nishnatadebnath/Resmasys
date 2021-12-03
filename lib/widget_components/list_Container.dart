import 'package:flutter/material.dart';
import 'package:flutter_app/const.dart';

class list_container extends StatelessWidget {
  list_container({this.label, this.labelcolor, this.number, this.percentage});

  final Color labelcolor;
  final String label;
  final double number;
  final double percentage;
  @override
  Widget build(BuildContext context) {
    int percent_int = percentage.toInt();
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: labelcolor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: kTextStyleGrey(
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                number.toInt().toString(),
                style: kTextStyleBlack(
                  size: 14,
                  weight: FontWeight.w600,
                ),
              ),
              Text(
                '($percent_int%)'.toString(),
                style: kTextStyleGrey(
                  size: 12,
                  weight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
