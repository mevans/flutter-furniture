import 'package:furnitureshop/models/category.dart';

class Product {
  final String imageUrl;
  final String name;
  final double cost;
  final String description;
  final Category category;
  final int id;
  Product(this.imageUrl, this.name, this.cost, this.description, this.category,
      this.id);

  @override
  String toString() {
    return 'Product{imageUrl: $imageUrl, name: $name, cost: $cost, description: $description, category: $category, id: $id}';
  }
}
