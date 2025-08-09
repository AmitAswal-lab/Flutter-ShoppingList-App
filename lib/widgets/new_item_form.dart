
import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/category.dart';
import 'package:shopping_list_app/models/grocery_items.dart';

class NewItemForm extends StatefulWidget {
  const NewItemForm({super.key});

  @override
  State<NewItemForm> createState() => _NewItemFormState();
}

class _NewItemFormState extends State<NewItemForm> {
  final _formkey  =GlobalKey<FormState>();

  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.dairy];

  void _saveItem(){
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      Navigator.of(context).pop(
        GroceryItems(
          quantity: _enteredQuantity, 
          category: _selectedCategory!, 
          id: DateTime.now().toString(), 
          name: _enteredName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredName,
                maxLength: 30,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'Item name must be between 1 to 30 character long';
                  }
                  return null;
                },
                onSaved: (value){
                  _enteredName = value!;
                },

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Quantity'),
                        ),
                        initialValue: _enteredQuantity.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <=0) {
                            return 'Only positive number G';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _enteredQuantity = int.parse(value!);
                        },
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for(final category in categories.entries)
                         DropdownMenuItem(
                          value: category.value,
                          child: Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              color: category.value.color,
                            ),
                            SizedBox(width: 6,),
                            Text(category.value.title),
                          ],
                         ),)
                          
                      ], 
                      onChanged: (value){
                        setState(() {
                          _selectedCategory = value;
                        });
                      }),
                  )
                ],
              ),
              SizedBox(height: 28,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    _formkey.currentState!.reset();
                  }, child: Text('Reset')),
                  SizedBox(width: 6,),
                  ElevatedButton(onPressed: _saveItem, child: Text('Add Item')),
                ],
              ),
            ],
          )),),
    );
  }
}