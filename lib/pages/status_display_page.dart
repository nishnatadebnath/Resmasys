import 'package:flutter/material.dart';
import 'package:status_change/status_change.dart';
import 'package:timeline_status/timeline_status.dart';

class status_bar extends StatelessWidget {
  const status_bar({
    Key key,
    int this.currentPosition,
  }) : super(key: key);

  final bool showTimeline = true;
  final int currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: showTimeline,
              // give list of string
              child: TimeLineStatus(
                statuses: [
                  'Preparing!',
                  'Cooked!',
                  'Served',
                ],
                currentPosition: currentPosition,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
