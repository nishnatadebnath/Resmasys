import 'package:flutter/material.dart';
import '../const.dart';

class Search_bar extends StatelessWidget {
  const Search_bar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kbluecolor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(35, 5, 35, 10),
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Image(
                image: AssetImage('assets/search.png'),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Search...',
                style: kTextStyleGrey(
                  weight: FontWeight.w500,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
