import 'package:flutter_app/const.dart';
import 'package:flutter/material.dart';

class graph_labeling extends StatelessWidget {
  graph_labeling({this.label, this.labelcolor});
  final Color labelcolor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: labelcolor,
          radius: 4,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: kTextStyleGrey(
            size: 14,
            weight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
