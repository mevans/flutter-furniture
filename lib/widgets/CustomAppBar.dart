import 'package:flutter/material.dart';
import 'package:furnitureshop/pages/ShoppingBasketPage.dart';
import 'package:furnitureshop/widgets/CartIcon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final preferredSize = new Size.fromHeight(164.0);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () => print("Nav Drawer"),
                    color: Colors.white,
                    iconSize: 28.0,
                  ),
                  Text(
                    "Discover",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(48.0),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ShoppingBasketPage())),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CartIcon(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 10.0, right: 16.0, bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.search),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "What are you looking for ?",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(width: 10.0, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
