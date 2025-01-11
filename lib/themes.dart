import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

//Light theme
Color backgroundColorLight = Color.fromARGB(255, 239, 239, 239);
Color accentColorLight =
    Color.fromARGB(255, 91, 155, 213); // For timers and stuff
Color onSurfaceColorLight = Color.fromARGB(255, 0, 0, 0);
Color underlineColorLight = Color.fromARGB(255, 0, 0, 0);
Color secondaryColorLight =
    Color.fromARGB(255, 145, 199, 136); //For add action background
Color secondaryColorOutlineLight = Color(0xFFC5C5C5);
Color actionsBackgroundLight = backgroundColorLight;
Color actionOutlineLight = Color.fromARGB(255, 197, 197, 197);
Color onActionsLight = Color(0xFF3A3a3A);
Color dangerColorLight = Color(0xFFF28C8C);
Color onDangerColorLight = Color(0xFF2C3E50);
Color onSecondaryColorLight = Color(0xFF3D3D3D);
Color confirmColorLight = Color(0xFF07A112);

//Dark Theme
Color backgroundColorDarkStart = Color(0xFF1E1E1E);
Color backgroundColorDarkEnd = Color(0xFF2D2D2D);
Color accentColorDark = Color(0xFF4A90E2);
Color onSurfaceColorDark = Color(0xFFFFFFFF);
Color underlineColorDark = Color(0xFFE0E0E0);
Color secondaryColorDark = Color(0xFF2ECC71);
Color secondaryColorOutlineDark = Color(0xFFB0B0B0);
Color actionsBackgroundDark = Color(0xFF232831);
Color actionOutlineDark = Color(0xFFB0B0B0);
Color onActionsDark = Color(0xFFFFFFFF);
Color dangerColorDark = Color(0xFFE74C3C);
Color onDangerColorDark = Color(0xFFFFFFFF);
Color onSecondaryColorDark = Color(0xFF000000);
Color confirmColorDark = Color(0xFF07A112);
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
        color: secondaryColorLight,
      ),
//for small timer
      displaySmall: GoogleFonts.dmSans(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: secondaryColorLight,
      ),

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
//For Add actions button and clear button text
      bodySmall: GoogleFonts.amaticSc(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: onSurfaceColorLight,
      ),
//For actions text
      bodyMedium: GoogleFonts.amaticSc(
        fontSize: 36,
        fontWeight: FontWeight.normal,
        color: onSurfaceColorLight,
      ),
    ));

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
        color: secondaryColorDark,
      ),
//for small timer
      displaySmall: GoogleFonts.dmSans(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: secondaryColorDark,
      ),

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
//For Add actions button and clear button text
      bodySmall: GoogleFonts.amaticSc(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: onSurfaceColorDark,
      ),
//For actions text
      bodyMedium: GoogleFonts.amaticSc(
        fontSize: 36,
        fontWeight: FontWeight.normal,
        color: onSurfaceColorDark,
      ),
    ));
