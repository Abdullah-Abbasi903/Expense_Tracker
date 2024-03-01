import 'package:expense_tracker/views/expense.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          cardTheme:const CardTheme().copyWith(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: kDarkColorScheme.secondaryContainer),
               textTheme: const TextTheme().copyWith(
                titleLarge: const TextStyle(
                  fontSize: 16
                )
               ),
               elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColorScheme.primaryContainer,
                  foregroundColor: kDarkColorScheme.onPrimaryContainer,
                )
               )
        ),
          // ignore: deprecated_member_use
          
              
        
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: kColorScheme.secondaryContainer),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.secondaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 14),
              ),
        ),
        home: const Expense());
  }
}
