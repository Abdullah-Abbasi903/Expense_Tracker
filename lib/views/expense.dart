import 'package:expense_tracker/models/data/expense_type.dart';
import 'package:expense_tracker/models/data/show_list.dart';
import 'package:expense_tracker/views/add_expense.dart';
import 'package:expense_tracker/views/chart/chart.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseType> addedExpense = [
    ExpenseType(
        title: "Flutter",
        amount: 20.0,
        date: DateTime.now(),
        catagory: Catagory.work),
    ExpenseType(
        title: "Cinema",
        amount: 30.5,
        date: DateTime.now(),
        catagory: Catagory.leisure),
  ];
  void openAddExpense(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(onAddExpense: addExp),
    );
  }

  void addExp(ExpenseType exp) {
    setState(() {
      addedExpense.add(exp);
    });
  }

  void removeExp(ExpenseType exp) {
    final removeIndex = addedExpense.indexOf(exp);
    setState(() {
      addedExpense.remove(exp);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                addedExpense.insert(removeIndex, exp);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              openAddExpense(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
           Chart(expenses: addedExpense),
          Expanded(
            child: addedExpense.isEmpty
                ? const Center(
                    child: Text("Kindly Add Some Expenses"),
                  ): ShowList(
                    addedExpense,
                    onRemoveExpense: removeExp,
                  ),
          ),
        ],
      ),
    );
  }
}
