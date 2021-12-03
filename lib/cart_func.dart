import 'menuData.dart';
import 'cartData.dart';
import 'const.dart';

class Cart_func {
  static void addToCart(menuData item, int quantity) {
    Global_var.cart.add(CartData(data: item, quantity: quantity));
  }

  static void clearCart() {
    Global_var.cart.clear();
  }

  static void incDec_item(String uid, int value) {
    for (int i = 0; i < Global_var.cart.length; i++) {
      if (Global_var.cart[i].data.uidItem == uid) {
        Global_var.cart[i].quantity += value;
      }
    }
  }
}
