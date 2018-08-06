import 'package:flutter/material.dart';
import 'package:furnitureshop/data.dart';
import 'package:furnitureshop/models/product.dart';
import 'package:furnitureshop/models/shopping_basket.dart';
import 'package:furnitureshop/models/wishlist.dart';
import 'package:furnitureshop/pages/category_page.dart';
import 'package:furnitureshop/widgets/category_card_scroller.dart';
import 'package:furnitureshop/widgets/custom_app_bar.dart';
import 'package:furnitureshop/widgets/hot_product_card.dart';
import 'package:furnitureshop/widgets/product_list_item.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Quicksand", primaryColor: Color(0xff215AED)),
    debugShowCheckedModeBanner: false,
    home: MyApp()));

//TODO: Wish list
//TODO: Nav drawer

class MyApp extends StatefulWidget {
  static ShoppingBasket shoppingBasket = ShoppingBasket();
  static WishList wishList = WishList();

  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String searchTerm = "";

  List<Product> shuffleAndReturn(List<Product> products) {
    List<Product> r = products;
    r.shuffle();
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          padding: EdgeInsets.only(left: 16.0, top: 32.0),
          width: 250.0,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
            ]..addAll(Data.categories.map((c) => Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => CategoryPage(c)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(c.icon),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(c.name),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))),
          ),
        ),
        key: scaffoldKey,
        appBar: CustomAppBar((s) {
          setState(() {
            searchTerm = s;
          });
        }, scaffoldKey),
        body: searchTerm == ""
            ? ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      "Category",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Color(0xff444444)),
                    ),
                  ),
                  CategoryCardScroller(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Hot Items",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Color(0xff444444)),
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
              )
            : Container(
                child: ListView.builder(
                    itemCount: Data.products
                        .where((p) => p.name
                            .toLowerCase()
                            .contains(searchTerm.toLowerCase()))
                        .length,
                    itemBuilder: (ctx, index) {
                      return ProductListItem(Data.products
                          .where((p) => p.name
                              .toLowerCase()
                              .contains(searchTerm.toLowerCase()))
                          .toList()[index]);
                    }),
              ));
  }
}
