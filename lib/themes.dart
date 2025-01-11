import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:timely/colors.dart";

final ThemeData myThemeLight = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorLight,
    primaryColor: actionsBackgroundLight, // actions
    dividerColor: underlineColorLight,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: actionsBackgroundLight, //Actions card background color
      onPrimary: onActionsLight,
      secondary: secondaryColorLight, //add actions background color
      onSecondary: onSecondaryColorLight,
      error: dangerColorLight,
      onError: onDangerColorLight,
      surface: backgroundColorLight,
      onSurface: onSurfaceColorLight,
      tertiary: confirmColorLight, // Confirmation
    ),
    textTheme: TextTheme(
//For The Huge Timer
        displayLarge: GoogleFonts.dmSans(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: accentColorLight,
            decoration: TextDecoration.underline,
            decorationColor: underlineColorLight),
//for small timer
        displaySmall: GoogleFonts.dmSans(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: accentColorLight,
            decoration: TextDecoration.underline,
            decorationColor: underlineColorLight),

//For Heading Hey timely
        headlineSmall: GoogleFonts.amaticSc(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorLight,
        ),
//For Add actions in empty list
        bodyLarge: GoogleFonts.amaticSc(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorLight,
        ),
//For  clear button text
        bodySmall: GoogleFonts.amaticSc(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorLight,
        ),
//For Add action
        titleMedium: GoogleFonts.amaticSc(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: onSecondaryColorLight,
        ),
//For actions text
        bodyMedium: GoogleFonts.amaticSc(
          fontSize: 36,
          fontWeight: FontWeight.normal,
          color: onSurfaceColorLight,
        ),
        titleSmall: GoogleFonts.amaticSc(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorLight,
        )));

final ThemeData myThemeDark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: actionsBackgroundDark, // actions
    dividerColor: underlineColorDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: actionsBackgroundDark, //Actions card background color
      onPrimary: onActionsDark,
      secondary: secondaryColorDark, //add actions background color
      onSecondary: onSecondaryColorDark,
      error: dangerColorDark,
      onError: onDangerColorDark,
      surface: Colors.transparent,
      onSurface: onSurfaceColorDark,
      tertiary: confirmColorDark, // Confirmation
    ),
    textTheme: TextTheme(
//For The Huge Timer
        displayLarge: GoogleFonts.dmSans(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: accentColorDark,
            decoration: TextDecoration.underline,
            decorationColor: underlineColorDark,
            decorationThickness: 0.5),
//for small timer
        displaySmall: GoogleFonts.dmSans(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: accentColorDark,
            decoration: TextDecoration.underline,
            decorationColor: underlineColorDark),

//For Heading Hey timely
        headlineSmall: GoogleFonts.amaticSc(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorDark,
        ),
//For Add actions in empty list
        bodyLarge: GoogleFonts.amaticSc(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorDark,
        ),
//clear button text
        bodySmall: GoogleFonts.amaticSc(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorDark,
        ),
//For Add action
        titleMedium: GoogleFonts.amaticSc(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: onSecondaryColorDark,
        ),
//For actions text
        bodyMedium: GoogleFonts.amaticSc(
          fontSize: 36,
          fontWeight: FontWeight.normal,
          color: onSurfaceColorDark,
        ),
        //For durations Text
        titleSmall: GoogleFonts.amaticSc(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: onSurfaceColorDark,
        )));
