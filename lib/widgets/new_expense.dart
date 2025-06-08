import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //Slot for title writing
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),

          //Fill up Slots
          Row(
            children: [
              Expanded(
                child: TextField(
                  //Slot for fill up the amount
                  maxLength: 5,
                  controller: _amountController,
                  keyboardType: TextInputType.number,

                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),

              Expanded(
                //Use expanded because using Row in Row widget
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      //No of selected date picker
                      _selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          //Buttons
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items:
                    Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  // if(value==null){
                  //   return;
                  // }
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),

              const Spacer(),

              // Cancel Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),

              // Save Expense Button
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
