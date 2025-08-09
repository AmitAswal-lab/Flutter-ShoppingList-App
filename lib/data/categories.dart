import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/category.dart';

const categories = {
  Categories.produce: Category(
    'Produce',
    Color.fromARGB(255, 0, 255, 128), // Green
  ),
  Categories.meat: Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0), // Orange
  ),
  Categories.dairy: Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255), // Light Blue
  ),
  Categories.bakery: Category(
    'Bakery',
    Color.fromARGB(255, 255, 204, 128), // Soft Beige
  ),
  Categories.pantry: Category(
    'Pantry',
    Color.fromARGB(255, 0, 60, 255), // Blue
  ),
  Categories.snacks: Category(
    'Snacks',
    Color.fromARGB(255, 255, 149, 0), // Bright Orange
  ),
  Categories.drinks: Category(
    'Drinks',
    Color.fromARGB(255, 145, 255, 0), // Lime
  ),
  Categories.spices: Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0), // Yellow
  ),
  Categories.household: Category(
    'Household',
    Color.fromARGB(255, 191, 0, 255), // Purple
  ),
  Categories.personal: Category(
    'Personal Care',
    Color.fromARGB(255, 149, 0, 255), // Deep Purple
  ),
  Categories.baby: Category(
    'Baby Products',
    Color.fromARGB(255, 255, 182, 193), // Light Pink
  ),
  Categories.pets: Category(
    'Pet Supplies',
    Color.fromARGB(255, 255, 105, 180), // Pink
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255), // Cyan
  ),
};
