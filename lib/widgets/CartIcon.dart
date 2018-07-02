import 'package:flutter/material.dart';
import 'package:furnitureshop/pages/Main.dart';

class CartIcon extends StatefulWidget {
  @override
  CartIconState createState() {
    return new CartIconState();
  }
}

class CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
        (MyApp.shoppingBasket.itemsAndQuantities.length != 0 ? NumberInRedCircle(MyApp.shoppingBasket.totalItems) : Container())
      ],
    );
  }
}

class NumberInRedCircle extends StatelessWidget {
  final int number;
  NumberInRedCircle(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
      child: Center(
        child: Text(
          number < 10 ? number.toString() : "9+",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
      ),
    );
  }
}
