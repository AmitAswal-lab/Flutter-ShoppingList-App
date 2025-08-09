import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_items.dart';
import 'package:shopping_list_app/models/category.dart';
import 'package:shopping_list_app/widgets/new_item_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItems> _groceryItems = [
    GroceryItems(
      category: categories[Categories.pantry]!,
      id: 'a',
      name: 'Rice',
      quantity: 5,
    ),
    GroceryItems(
      category: categories[Categories.drinks]!,
      id: 'b',
      name: 'Coco-Cola',
      quantity: 2,
    ),
  ];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItems>(
      MaterialPageRoute(builder: (ctx) => const NewItemForm()),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Text('No Grocery added yet.'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          onDismissed: (direction){
            setState(() {
              _groceryItems.remove(_groceryItems[index]);
            });     
          },
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 16,
              height: 16,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
