import 'package:flutter/material.dart';
import 'package:furnitureshop/data.dart';
import 'package:furnitureshop/models/category.dart';
import 'package:furnitureshop/models/category_filter.dart';
import 'package:furnitureshop/models/product.dart';
import 'package:furnitureshop/widgets/product_list_item.dart';

class CategoryPage extends StatefulWidget {
  final Category category;

  CategoryPage(this.category);

  @override
  CategoryPageState createState() {
    return new CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {
  CategoryFilter filter = CategoryFilter("", SortBy.AZ);
  TextEditingController textEditingController = TextEditingController();
  SortBy sortBy;

  @override
  void initState() {
    sortBy = filter.sort;
    super.initState();
  }

  void changeSort(SortBy newSort) {
    setState(() {
      sortBy = newSort;
    });
  }

  void filterResults(CategoryFilter newFilter) {
    setState(() {
      filter = newFilter;
      textEditingController.text = newFilter.searchTerm;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> allProducts = Data.products
        .where((p) =>
            p.category == widget.category &&
            p.name.toLowerCase().contains(filter.searchTerm.toLowerCase()))
        .toList();

    switch (sortBy) {
      case SortBy.LowestPrice:
        allProducts.sort((p1, p2) => p1.cost < p2.cost ? 0 : 1);
        break;
      case SortBy.HighPrice:
        allProducts.sort((p1, p2) => p1.cost > p2.cost ? 0 : 1);
        break;
      case SortBy.AZ:
        allProducts.sort(
            (p1, p2) => p1.name.toLowerCase().compareTo(p2.name.toLowerCase()));
        break;
      case SortBy.ZA:
        allProducts.sort(
            (p1, p2) => p2.name.toLowerCase().compareTo(p1.name.toLowerCase()));
        break;
    }

    return Scaffold(
      endDrawer: Container(
          color: Colors.white,
          width: 250.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Filter",
                          style: TextStyle(fontSize: 28.0),
                        ),
                        FlatButton(
                            onPressed: () {
                              filterResults(CategoryFilter("", SortBy.AZ));
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ))
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Search..."),
                      controller: textEditingController,
                      onSubmitted: (t) =>
                          filterResults(CategoryFilter(t, sortBy)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        "Sort",
                        style: TextStyle(fontSize: 28.0),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: SortBy.LowestPrice,
                          groupValue: sortBy,
                          onChanged: (e) => changeSort(SortBy.LowestPrice),
                        ),
                        Expanded(child: Text("Lowest Price")),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: SortBy.HighPrice,
                          groupValue: sortBy,
                          onChanged: (e) => changeSort(SortBy.HighPrice),
                        ),
                        Expanded(child: Text("Highest Price")),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: SortBy.AZ,
                          groupValue: sortBy,
                          onChanged: (e) => changeSort(SortBy.AZ),
                        ),
                        Expanded(child: Text("A - Z")),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: SortBy.ZA,
                          groupValue: sortBy,
                          onChanged: (e) => changeSort(SortBy.ZA),
                        ),
                        Expanded(child: Text("Z - A")),
                      ],
                    ),
                  ],
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 16.0, top: 44.0, right: 16.0),
                ),
              ),
              InkWell(
                onTap: () {
                  filterResults(
                      CategoryFilter(textEditingController.text, sortBy));
                  Navigator.pop(context);
                },
                child: Container(
                  width: 250.0,
                  height: 100.0,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                      child: Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          )),
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          "Category: " + widget.category.name,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: allProducts.length != 0
              ? ListView.builder(
                  itemBuilder: (ctx, index) =>
                      ProductListItem(allProducts[index]),
                  itemCount: allProducts.length,
                )
              : Center(
                  child: Text(
                  "No products match this criteria",
                  style: TextStyle(color: Colors.grey),
                ))),
    );
  }
}
