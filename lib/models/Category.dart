import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  Category(this.name, this.icon);

  @override
  String toString() {
    return 'Category{name: $name, icon: $icon}';
  }
}
