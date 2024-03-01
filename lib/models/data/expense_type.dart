import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Catagory { food, travel, leisure, work }

final formatter = DateFormat.yMd();

const catagoryIcons = {
  Catagory.food: Icons.lunch_dining,
  Catagory.work: Icons.work,
  Catagory.leisure: Icons.movie,
  Catagory.travel: Icons.flight_takeoff,
};

class ExpenseType {
  ExpenseType(
      {required this.title,
      required this.amount,
      required this.date,
      required this.catagory});

  String title;
  double amount;
  DateTime date;
  Catagory catagory;

  String get foramattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.cCatagory,
    required this.cExpenses,
  });


  ExpenseBucket.forCategory(List<ExpenseType> allExpense, this.cCatagory):cExpenses=allExpense.where((exp) => exp.catagory==cCatagory).toList();
  List<ExpenseType> cExpenses;
  Catagory cCatagory;

  double get totalExpenses  {
    double sum = 0;
    for (final expense in cExpenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
