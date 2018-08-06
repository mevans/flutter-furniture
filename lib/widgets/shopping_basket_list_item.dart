import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furnitureshop/models/product.dart';
import 'package:furnitureshop/pages/main_page.dart';
import 'package:furnitureshop/pages/product_page.dart';

class ShoppingBasketListItem extends StatefulWidget {
  final Product product;
  final Function onUpdate;

  ShoppingBasketListItem(this.product, this.onUpdate);

  @override
  ShoppingBasketListItemState createState() {
    return new ShoppingBasketListItemState();
  }
}

class ShoppingBasketListItemState extends State<ShoppingBasketListItem> {
  void changeProductQuantity(amount) {
    setState(() {
      MyApp.shoppingBasket.removeProductFromBasket(widget.product.id, -amount);
      widget.onUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => ProductPage(widget.product))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: widget.product.imageUrl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.product.name),
                      Text("\$${widget.product.cost.toString().split(".")[0]}")
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 2.0),
                    borderRadius: BorderRadius.circular(64.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.black54,
                      ),
                      onPressed: () => changeProductQuantity(-1),
                    ),
                    Text(
                      MyApp.shoppingBasket.itemsAndQuantities[widget.product.id]
                          .toString(),
                      style: TextStyle(color: Colors.black54),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black54,
                      ),
                      onPressed: () => changeProductQuantity(1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 0.0,
          )
        ],
      ),
    );
  }
}
