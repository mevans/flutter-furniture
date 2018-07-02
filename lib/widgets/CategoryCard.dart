import 'package:flutter/material.dart';
import 'package:furnitureshop/Data.dart';
import 'package:furnitureshop/models/Category.dart';
import 'package:furnitureshop/pages/CategoryPage.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final int index;
  final Color color = Color(0xff444444);
  CategoryCard(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CategoryPage(category))),
      child: Container(
        margin: EdgeInsets.only(top: 16.0, bottom: 16.0, left: index == 0 ? 16.0 : 8.0, right: index == Data.categories.length - 1 ? 16.0 : 8.0),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.0), boxShadow: [BoxShadow(color: Color(0x1a000000), spreadRadius: 2.0, blurRadius: 9.0)]),
        width: 120.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                category.icon,
                color: color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 12.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    category.name,
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20.0,
                    color: color,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
