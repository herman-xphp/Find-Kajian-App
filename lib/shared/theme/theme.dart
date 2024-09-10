import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';

ThemeData getDefaultTheme() {
  return ThemeData().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    appBarTheme: AppBarTheme(
      elevation: 0.6,
      titleTextStyle: GoogleFonts.ibmPlexSans(
        color: Colors.white,
      ),
      backgroundColor: appBarColor,
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
      color: primaryColor,
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
          color: Colors.grey[300]!,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          // color: tertiaryColor,
          color: Colors.grey[300]!,
          width: 1.2,
          // color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          // color: Colors.red,
          color: dangerColor,
          width: 1.2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: tertiaryColor,
          width: 1.4,
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
        //   color: Colors.grey[300]!,
        // ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.blueGrey,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      modalBackgroundColor: cardColor,
      modalElevation: 0.6,
      elevation: 0.6,
      clipBehavior: Clip.antiAlias,
    ),
  );
}
