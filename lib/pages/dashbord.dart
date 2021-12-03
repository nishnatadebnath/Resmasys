import 'package:flutter/material.dart';
import 'package:flutter_app/const.dart';
import 'package:flutter_app/widget_components/reusable_card.dart';
//import 'side_drawer.dart';
import '../dashboard_components/search_bar.dart';
import '../dashboard_components/pending_order_status.dart';
import 'package:flutter_app/dashboard_components/Pending_order.dart';
import 'package:flutter_app/dashboard_components/Finished_homwork.dart';
import 'package:flutter_app/dashboard_components/underperforming_std.dart';
import 'package:flutter_app/dashboard_components/average_marks.dart';
import 'package:flutter_app/dashboard_components/lection_left.dart';
import 'package:flutter_app/dashboard_components/hrs_lection_card.dart';
import 'package:flutter_app/widget_components/graph_labels.dart';
import '../widget_components/list_Container.dart';

// ignore: camel_case_types
class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: kbluecolor,
        shadowColor: kbluecolor,
        title: Image(
          image: AssetImage('assets/graphe_symbol.png'),
        ),
        actions: [
          Image(
            image: AssetImage('assets/notifications.png'),
          ),
        ],
      ),
//drawer: SideDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFE5E5E5),
            child: Column(
              children: [
                //Search_bar(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Text('Dashboard',
                                    style: kTextStyleBlack(
                                      size: 28,
                                      weight: FontWeight.w600,
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: kbluecolor,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 16,
                                  child: Image(
                                    width: 12,
                                    height: 12,
                                    image:
                                        AssetImage('assets/edit_Dashboard.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 18,
                                child: Image(
                                  width: 14,
                                  height: 14,
                                  image: AssetImage('assets/plusdashboard.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: pending_orders(),
                          ),
                          Expanded(
                            child: hrs_spnt_lec_card(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Underperforming_card(),
                          ),
                          Expanded(
                            child: Finished_hw_card(),
                          ),
                        ],
                      ),
                      Pending_order_status(),
                      Row(
                        children: [
                          Expanded(
                            child: RevenueStats(),
                          ),
                          Expanded(
                            child: Issues(),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: ReusableCard(
                      //         card_height: 300,
                      //         colour: Colors.white,
                      //         cardChild: Column(
                      //           children: [
                      //             Container(
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: 12, vertical: 10),
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Text(
                      //                     'Students number change per month',
                      //                     style: kTextStyleBlack(
                      //                       size: 14,
                      //                       weight: FontWeight.w600,
                      //                     ),
                      //                   ),
                      //                   Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       graph_labeling(
                      //                         label: 'Applied',
                      //                         labelcolor: kbluecolor,
                      //                       ),
                      //                       SizedBox(
                      //                         height: 5,
                      //                       ),
                      //                       graph_labeling(
                      //                         label: 'Left',
                      //                         labelcolor: Color(0XFFFF7A00),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             Divider(
                      //               thickness: 1.5,
                      //               color: Color(0xFFEEF0F6),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: ReusableCard(
                      //         colour: Colors.white,
                      //         cardChild: Column(
                      //           children: [
                      //             Container(
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: 15, vertical: 15),
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Text(
                      //                     'Students by type of studying',
                      //                     style: kTextStyleBlack(
                      //                       size: 14,
                      //                       weight: FontWeight.w600,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             Divider(
                      //               thickness: 1.5,
                      //               color: Color(0xFFEEF0F6),
                      //             ),
                      //             SizedBox(
                      //               height: 250,
                      //             ),
                      //             list_container(
                      //               label: 'Groups of 20 students',
                      //               labelcolor: kbluecolor,
                      //               number: 20,
                      //               percentage: 32,
                      //             ),
                      //             list_container(
                      //               label: 'Groups of 10 students',
                      //               labelcolor: Color(0XFFFFB800),
                      //               number: 20,
                      //               percentage: 32,
                      //             ),
                      //             list_container(
                      //               label: 'Groups of 5 students',
                      //               labelcolor: Color(0XFFFF4C61),
                      //               number: 15,
                      //               percentage: 24,
                      //             ),
                      //             list_container(
                      //               label: 'Individual sessions',
                      //               labelcolor: Color(0XFF33D69F),
                      //               number: 7,
                      //               percentage: 12,
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
