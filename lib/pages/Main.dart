import 'package:flutter/material.dart';
import 'package:furnitureshop/Data.dart';
import 'package:furnitureshop/models/ShoppingBasket.dart';
import 'package:furnitureshop/widgets/CategoryCardScroller.dart';
import 'package:furnitureshop/widgets/CustomAppBar.dart';
import 'package:furnitureshop/widgets/ProductCard.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  static ShoppingBasket shoppingBasket = ShoppingBasket();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(fontFamily: "Quicksand", primaryColor: Color(0xff215AED)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                "Category",
                style: TextStyle(
                    fontWeight: FontWeight.w100, color: Color(0xff444444)),
              ),
            ),
            CategoryCardScroller(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Hot Items",
                style: TextStyle(
                    fontWeight: FontWeight.w100, color: Color(0xff444444)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.798,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: Data.products
                    .where((p) => p.id < 4)
                    .map((p) => ProductCard(p))
                    .toList(),
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
