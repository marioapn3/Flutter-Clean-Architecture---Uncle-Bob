import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0XFFF6F6F6),
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Color(0XFFF6F6F6),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xff8b8b8b)),
      titleTextStyle: TextStyle(color: Color(0xff8b8b8b), fontSize: 18));
}
