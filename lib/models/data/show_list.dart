import 'package:expense_tracker/models/data/expense_type.dart';
import 'package:expense_tracker/models/data/full_expense.dart';
import 'package:flutter/material.dart';

class ShowList extends StatelessWidget {
  const ShowList(this.expense, {required this.onRemoveExpense ,super.key});

  final void Function(ExpenseType) onRemoveExpense;
  final List<ExpenseType> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (BuildContext context, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
          ),
          onDismissed: (direction){
             onRemoveExpense(expense[index]);
          },
          key: ValueKey(expense[index]),
          child: FullExpense(
            expense[index],
          ),
        ),
      );
    
  }
}
