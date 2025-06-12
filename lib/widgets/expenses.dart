import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker_app/widgets/chart/chart.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // List to store registered expenses
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Courses',
      amount: 30,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Tanguar Hawar',
      amount: 100,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  // Function to add an expense to the list
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // Function to remove an expense from the list
  void _removeExpensse(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });


    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      //Show messege after delet Expense and Als0 undo delete Expenses
      SnackBar(
        duration: Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  // Function to open the overlay for adding a new expense

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expenses found.Start adding your Expenses'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemovedExpense: _removeExpensse,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter ExpenseTracker',
          style: GoogleFonts.exo2(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      
      body: Column(
        
        children: [Chart(expenses:  _registeredExpenses), Expanded(child: mainContent)],
      ),
    );
  }
}
