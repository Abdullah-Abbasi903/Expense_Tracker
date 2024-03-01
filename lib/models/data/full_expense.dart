import 'package:expense_tracker/models/data/expense_type.dart';
import 'package:flutter/material.dart';

class FullExpense extends StatelessWidget {
  const FullExpense(this.exps, {super.key});
  final ExpenseType exps;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              exps.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text("\$ ${exps.amount.toString()}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(catagoryIcons[exps.catagory]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(exps.foramattedDate.toString())
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
