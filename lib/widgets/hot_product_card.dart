import 'package:flutter/material.dart';
import 'package:furnitureshop/models/product.dart';
import 'package:furnitureshop/pages/product_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => ProductPage(product))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          overflow: Overflow.clip,
          children: <Widget>[
            Hero(
              tag: "product_${product.toString()}",
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Container(
              color: Color(0x47000000),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "\$" + product.cost.toString().split(".")[0],
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                        Icon(
                          Icons.favorite,
                          color: product.favourite
                              ? Colors.redAccent
                              : Colors.white,
                          size: 16.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
