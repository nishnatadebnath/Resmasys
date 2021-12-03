import 'package:firebase_database/firebase_database.dart';
import 'const.dart';
import 'menuData.dart';

class Firebase_Func {
  static void addOrdersToOngoingOrders(
      DatabaseReference databaseReference, List<int> cart_indexes) {
    var dateTime = DateTime.now();

    for (int i = 0; i < cart_indexes.length; i++) {
      databaseReference
          .child("Ongoing Orders")
          .child(
              dateTime.millisecondsSinceEpoch.toString() + '_' + i.toString())
          .set({
        'item': Global_var.cart[cart_indexes[i]].data.nameOfItem,
        'quantity': Global_var.cart[cart_indexes[i]].quantity.toString(),
        'status': 'Preparing',
        'tableNo': '10',
      });
    }
  }

  // static void addOrdersToOngoingOrders(DatabaseReference databaseReference) {
  //   var dateTime = DateTime.now();
  //   databaseReference
  //       .child("Ongoing Orders")
  //       .child(dateTime.millisecondsSinceEpoch.toString())
  //       .set({
  //     'item': 'Friedrice',
  //     'quantity': Global_var.cart_list[0].toString(),
  //     'status': 'Preparing',
  //     'tableNo': '',
  //   });
  // }

  static void addItemToMenu(
      DatabaseReference databaseReference, menuData data) {
    var dateTime = DateTime.now();

    databaseReference
        .child("Menu")
        .child(dateTime.millisecondsSinceEpoch.toString())
        .set({
      'name': data.nameOfItem,
      'description': data.description,
      'price': data.priceOfItem,
      'image': data.image,
    });
  }

  static void deleteItemFromMenu(
      DatabaseReference databaseReference, String uidItem) {
    databaseReference.child("Menu").child(uidItem).remove();
  }
}
