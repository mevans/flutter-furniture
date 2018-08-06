import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furnitureshop/models/product.dart';

import 'main_page.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  ProductPage(this.product);

  @override
  ProductPageState createState() {
    return new ProductPageState();
  }
}

class ProductPageState extends State<ProductPage> {
  void toggle() {
    setState(() {
      MyApp.wishList.products.contains(widget.product)
          ? MyApp.wishList.products.remove(widget.product)
          : MyApp.wishList.products.add(widget.product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      body: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: "product_${widget.product.toString()}",
                    child: CachedNetworkImage(
                      imageUrl: widget.product.imageUrl,
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          onPressed: () => Navigator.of(context).pop())),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 16.0, bottom: 50.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: 30.0,
                          ),
                          color:
                              MyApp.wishList.products.contains(widget.product)
                                  ? Colors.redAccent
                                  : Colors.white,
                          onPressed: () => toggle(),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.product.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "\$" + widget.product.cost.toString().split(".")[0],
                      style: TextStyle(
                          color: Color(0xff8E8EF6),
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        height: 2.0,
                        width: 221.0,
                        color: Color(0xffDEDEDE),
                      ),
                    ),
                    Text(widget.product.description),
                  ],
                ),
              ),
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                MyApp.shoppingBasket.addProductToBasket(widget.product.id, 1);
                key.currentState.showSnackBar(new SnackBar(
                  content: new Text(
                      "${widget.product.name} has been added to your basket"),
                ));
              },
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: Center(
                child: Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
