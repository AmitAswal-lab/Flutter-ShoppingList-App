import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_items.dart';
import 'package:shopping_list_app/models/category.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItems> _grocery_items = [
    GroceryItems(category: categories[Categories.pantry]!, id: 'a',name: 'Rice',quantity: 5),
    GroceryItems(category: categories[Categories.drinks]!, id: 'b',name: 'Coco-Cola',quantity: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: _grocery_items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_grocery_items[index].name),
          leading: Container(
            width: 16,
            height: 16,
            color: _grocery_items[index].category.color,
          ),
          trailing: Text(_grocery_items[index].quantity.toString()),
        )),
    );
  }
}