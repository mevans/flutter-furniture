import 'package:flutter/material.dart';
import 'package:furnitureshop/models/Product.dart';
import 'package:furnitureshop/pages/Main.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  ProductPage(this.product);

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
                    tag: "product_${product.toString()}",
                    child: Image.network(
                      product.imageUrl,
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
                        child: Icon(
                          Icons.favorite,
                          size: 30.0,
                          color: Colors.white,
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
                      product.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "\$" + product.cost.toString().split(".")[0],
                      style:
                          TextStyle(color: Color(0xff8E8EF6), fontSize: 16.0),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        height: 2.0,
                        width: 221.0,
                        color: Color(0xffDEDEDE),
                      ),
                    ),
                    Text(product.description),
                  ],
                ),
              ),
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                MyApp.shoppingBasket.addProductToBasket(product.id, 1);
                key.currentState.showSnackBar(new SnackBar(
                  content:
                      new Text("${product.name} has been added to your basket"),
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
