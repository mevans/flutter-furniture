import 'package:furnitureshop/data.dart';

class ShoppingBasket {
  Map<int, int> itemsAndQuantities = {};

  ShoppingBasket();

  void addProductToBasket(productID, quantity) {
    if (itemsAndQuantities.keys.contains(productID)) {
      itemsAndQuantities[productID] = itemsAndQuantities[productID] + quantity;
    } else {
      itemsAndQuantities[productID] = quantity;
    }
  }

  void removeProductFromBasket(productID, quantity) {
    if (itemsAndQuantities.keys.contains(productID)) {
      if (quantity < itemsAndQuantities[productID]) {
        itemsAndQuantities[productID] =
            itemsAndQuantities[productID] - quantity;
      } else {
        itemsAndQuantities.remove(productID);
      }
    }
  }

  int get totalItems {
    int total = 0;
    itemsAndQuantities.forEach((p, q) => total += q);
    return total;
  }

  double get totalPrice {
    double total = 0.0;
    itemsAndQuantities.forEach((p, q) => total += Data.products[p].cost * q);
    return total;
  }
}
