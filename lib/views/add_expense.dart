import 'package:expense_tracker/models/data/expense_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();


Catagory selectedCatagory = Catagory.leisure;

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.onAddExpense});

  final void Function(ExpenseType expense) onAddExpense;
  @override
  State<AddExpense> createState() => _AddEXpenseState();
}

class _AddEXpenseState extends State<AddExpense> {
  final TextEditingController _tilteController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  
  DateTime? currDate;

  void showDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      currDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _tilteController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final setAmount= double.tryParse(_amountController.text) ?? 0.0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _tilteController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter a Title";
                }
                return null;
              },
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Title")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _amountController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Valid Amount";
                      }
                      return null;
                    },
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: "\$  ",
                      label: Text("Amount"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Text(
                  currDate == null
                      ? "No Date Selected"
                      : formatter.format(currDate!),
                ),
                IconButton(
                  onPressed: showDate,
                  icon: const Icon(Icons.calendar_month),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                DropdownButton(
                  value: selectedCatagory,
                  items: Catagory.values
                      .map(
                        (catagory) => DropdownMenuItem(
                          value: catagory,
                          child: Text(
                            catagory.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCatagory = value;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (currDate != null) {
                        widget.onAddExpense(
                          ExpenseType(
                              title: _tilteController.text,
                              amount: setAmount,
                              date: currDate!,
                              catagory: selectedCatagory),
                        );
                        Navigator.pop(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Invalid Date"),
                            content: const Text("Pleas Enter A Valid Date"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                child: const Text("Okay"),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("Save Expense"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
