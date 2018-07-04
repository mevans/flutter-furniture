import 'package:flutter/material.dart';
import 'package:furnitureshop/data.dart';
import 'package:furnitureshop/models/category.dart';
import 'package:furnitureshop/models/product.dart';
import 'package:furnitureshop/pages/product_page.dart';

class CategoryPage extends StatelessWidget {
  final Category category;
  CategoryPage(this.category);

  @override
  Widget build(BuildContext context) {
    final List<Product> allProducts =
        Data.products.where((p) => p.category == category).toList();
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          "Category: " + category.name,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemBuilder: (ctx, index) => CategoryListItem(allProducts[index]),
            itemCount: allProducts.length,
          )),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final Product product;
  CategoryListItem(this.product);

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
              Image.network(
                product.imageUrl,
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
