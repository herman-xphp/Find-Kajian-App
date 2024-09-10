import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:find_kajian/shared/theme/theme_dark_config.dart';

ThemeData getDarkTheme() {
  return ThemeData().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    appBarTheme: AppBarTheme(
      elevation: 0.6,
      titleTextStyle: GoogleFonts.ibmPlexSans(
        color: Colors.white,
      ),
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cardColor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: tertiaryColor,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blueGrey[900],
    ),
    iconTheme: IconThemeData(
      color: textColor,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.ibmPlexSans(
        color: textColor,
      ),
      titleMedium: GoogleFonts.ibmPlexSans(
        color: textColor,
      ),
      titleLarge: GoogleFonts.ibmPlexSans(
        color: textColor,
      ),
      bodyLarge: GoogleFonts.ibmPlexSans(
        color: textColor,
      ),
      bodySmall: GoogleFonts.ibmPlexSans(
        color: textColor,
      ),
      bodyMedium: GoogleFonts.ibmPlexSans(
        color: textColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 4,
      ),
      hoverColor: Colors.transparent,
      errorMaxLines: 1,
      errorStyle: TextStyle(color: dangerColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: secondaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          // color: Colors.transparent,
          color: secondaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: dangerColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: secondaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          // color: tertiaryColor,
          color: textColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: dangerColor, // Warna border saat fokus dan ada error
          width: 1.4,
        ),
      ),
      filled: false,
      fillColor: inputColor,
    ),
    cardTheme: CardTheme(
      // elevation: 0.6,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: BorderSide(
        //   width: 0.4,
        //   // color: Colors.grey[300]!,
        // ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: primaryColor,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      modalBackgroundColor: primaryColor,
      modalElevation: 0.6,
      elevation: 0.6,
      clipBehavior: Clip.antiAlias,
    ),
  );
}
