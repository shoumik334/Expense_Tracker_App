import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'package:expense_tracker_app/widgets/expenses.dart';

// Define a color scheme using a seed color
var kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 86, 174, 212),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 1, 20, 62),
);

void main() {

  // WidgetsFlutterBinding.ensureInitialized(); //Orientation Lock
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
    runApp(
      MaterialApp(
        // Design For Dark Mode
        darkTheme: ThemeData.dark().copyWith(
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          ),

          textTheme: TextTheme().copyWith(
            bodySmall: TextStyle(
              color: const Color.fromARGB(255, 140, 136, 136),
            ),
          ),

          appBarTheme: AppBarTheme().copyWith(
            color: const Color.fromARGB(255, 50, 50, 50),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
          dropdownMenuTheme: DropdownMenuThemeData().copyWith(),
        ),

        //design for light mode
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,

          // Customize the AppBar appearance
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.onSecondaryContainer,
          ),

          // Customize the appearance of Card widgets
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: const Color.fromARGB(255, 90, 148, 163)),
            ),
          ),

          // Customize the appearance of ElevatedButton widgets
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer,
            ),
          ),

          // Customize the text theme of the app
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onPrimaryContainer,
              fontSize: 14,
            ),
          ),
        ),

        // themeMode: ThemeMode.system, // automatically aplied by system -default
        home: const Expenses(),
      ),
    );
 // });
}
