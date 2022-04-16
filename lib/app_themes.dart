import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 184, 20, 28);
  static const Color secondary = Colors.blueGrey;
  static const Color sliverColor = Color.fromARGB(120, 44, 41, 41);
  static TextStyle listTitle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle sliverTitle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
    
  );
  static TextStyle movieTitle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle movieSubtitle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle movieDetail = const TextStyle(
    fontSize: 15,
    color: Colors.black,
  );
  static TextStyle footer = const TextStyle(
    fontSize: 15,
    overflow: TextOverflow.ellipsis,
  );
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //primary color: indigo
    primaryColor: primary,
    //app bars
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    //text buttons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary),
    ),
    //floating buttons
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primary),
    //elevated buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    //inputs
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),
  );
  //dark
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
