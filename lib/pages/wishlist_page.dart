import 'package:flutter/material.dart';
import 'package:furnitureshop/pages/main_page.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        centerTitle: true,
      ),
      body: MyApp.wishList.products.length != 0
          ? Text("Stuff")
          : Center(
              child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black26,
                      size: 32.0,
                    ),
                  ),
                  Text(
                    "To add an item to your wishlist, \nclick the heart icon",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black26),
                  ),
                ],
              ),
            )),
    );
  }
}
