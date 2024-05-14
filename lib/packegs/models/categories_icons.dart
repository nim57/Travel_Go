import 'package:flutter/material.dart';

class CategoriesIcons {
  final String title,icon;

 
  CategoriesIcons({
    required this.icon,
    required this.title,
  });
}

List demoCategories = [
  CategoriesIcons(
    icon: 'images/icon/hottle.png',
    title: "Hotel",
  ),
  CategoriesIcons(
    icon: 'images/icon/food.png',
    title: "Food",
  ),
  CategoriesIcons(
   icon: 'images/icon/Drinks.png',
    title: "Drinks",
  ),
  CategoriesIcons(
   icon: 'images/icon/ticket.png',
    title: "Ticket",
  ),
  CategoriesIcons(
    icon: 'images/icon/guide.png',
    title: "Guide",
  ),
  CategoriesIcons(
    icon: 'images/icon/vechcal.png',
    title: "Vehicle",
  ),
];
