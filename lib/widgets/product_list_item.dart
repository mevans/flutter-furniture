import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furnitureshop/models/product.dart';
import 'package:furnitureshop/pages/product_page.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (ctx) => ProductPage(product))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: product.imageUrl,
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
                      Text(product.name),
                      Text(
                        "\$" + product.cost.toString().split(".")[0],
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
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
