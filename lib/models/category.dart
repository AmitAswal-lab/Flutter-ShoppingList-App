import 'package:flutter/material.dart';

enum Categories {
  produce,
  meat,
  dairy,
  bakery,
  pantry,
  snacks,
  drinks,
  spices,
  household,
  personal,
  baby,
  pets,
  other,
}

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}
