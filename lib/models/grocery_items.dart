import 'package:shopping_list_app/models/category.dart';

class GroceryItems {
  GroceryItems({
    required this.quantity,
    required this.category,
    required this.id,
    required this.name,
  });
  final String id;
  final String name;
  final int quantity;
  final Category category;
}