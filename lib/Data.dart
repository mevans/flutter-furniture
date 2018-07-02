import 'package:flutter/material.dart';
import 'package:furnitureshop/CustomIcons.dart';
import 'package:furnitureshop/models/Category.dart';
import 'package:furnitureshop/models/Product.dart';

class Data {
  static List<Category> categories = [
    Category("Plant", CustomIcons.plant),
    Category("Lamp", CustomIcons.desk_lamp),
    Category("Chair", CustomIcons.chair),
    Category("Other", Icons.timeline)
  ];
  static List<Product> products = [
    Product(
        "https://images.pexels.com/photos/112811/pexels-photo-112811.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Elegant Lamp",
        13.00,
        "Both practical and beautiful, this lamp is a great addition to any workspace",
        getCategoryFromName("Lamp"),
        false,
        0),
    Product(
        "https://images.pexels.com/photos/509922/pexels-photo-509922.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Traditional Chair",
        23.00,
        "A traditional chair, suitable for any application",
        getCategoryFromName("Chair"),
        false,
        1),
    Product(
        "https://images.pexels.com/photos/56589/cactus-plant-plant-rack-green-56589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Cactus",
        23.0,
        "in addition to being a decoration, cactus can also be a health benefit, let's buy cactus in our store because now discount 30%",
        getCategoryFromName("Plant"),
        false,
        2),
    Product(
        "https://images.pexels.com/photos/279618/pexels-photo-279618.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Cupboard",
        13.0,
        "Simplistic cupboard, which works in every situation",
        getCategoryFromName("Other"),
        false,
        3),
    Product(
        "https://images.pexels.com/photos/276534/pexels-photo-276534.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Reclined Chair",
        26.0,
        "White reclined chair",
        getCategoryFromName("Chair"),
        false,
        4),
    Product(
        "https://images.pexels.com/photos/993626/pexels-photo-993626.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Alfalfa Plant",
        6.0,
        "Potted Alfalfa Plant",
        getCategoryFromName("Plant"),
        false,
        5),
    Product(
        "https://images.pexels.com/photos/135168/pexels-photo-135168.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Rosemary",
        7.0,
        "Potted Rosemary Plant",
        getCategoryFromName("Plant"),
        false,
        6)
  ];

  static Category getCategoryFromName(name) {
    return categories.firstWhere(
        (c) => c.name.toLowerCase() == name.toString().toLowerCase());
  }
}
