import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_task/utils/themes/styles.dart';

class LightTheme {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColor.background,
    primaryColor: AppColor.primary,
    appBarTheme: _appBarTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
    cardTheme: _cardTheme(),
    snackBarTheme: _snackBarTheme(),
    listTileTheme: _listTileThemeData(),
    expansionTileTheme: _expansionTileThemeData(),
  );

  static _expansionTileThemeData() {
    return const ExpansionTileThemeData(
      collapsedIconColor: AppColor.blackText,
    );
  }

  static _listTileThemeData() {
    return const ListTileThemeData(
      minLeadingWidth: 30,
      horizontalTitleGap: 0.0,
    );
  }

  static _appBarTheme() {
    return const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
          color: AppColor.blackText,
          fontSize: 18,
          fontWeight: FontWeight.w700
      ),
    );
  }

  static _inputDecorationTheme() {
    var border = OutlineInputBorder(
      borderSide:  const BorderSide(
          width: 1, color: AppColor.borderColor),
      borderRadius: BorderRadius.circular(56.0),
    );
    return InputDecorationTheme(
      border: border,
      focusedBorder: border,
      enabledBorder: border,
      suffixIconColor: AppColor.disableColor,
    );
  }

  static _snackBarTheme() {
    return const SnackBarThemeData(
      backgroundColor: Colors.white,
      contentTextStyle: TextStyle(
        color: Color.fromRGBO(214, 81, 52, 1),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          disabledBackgroundColor: AppColor.primary.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )
      ),
    );
  }

  static _cardTheme() {
    return const CardTheme(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
    );
  }
}