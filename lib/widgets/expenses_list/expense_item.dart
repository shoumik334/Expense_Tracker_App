import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style:
                  Theme.of(context)
                      .textTheme
                      .titleLarge, // we can use here copywith method to addition theme design
            ), // Change the style from text Theme we set in main.dart file
            const SizedBox(height: 4),
            Row(
              children: [
                // Display the amount with a dollar sign, formatted to 2 decimal places
                Text('\$${expense.amount.toStringAsFixed(2)}'),

                const Spacer(), 
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
