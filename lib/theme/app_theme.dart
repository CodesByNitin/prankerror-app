import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that contains all theme configurations for the application.
class AppTheme {
  AppTheme._();

  // Platform-Native Error Palette Colors
  static const Color primaryErrorIOS = Color(0xFF007AFF); // iOS primary blue
  static const Color primaryErrorAndroid =
      Color(0xFF2196F3); // Android primary blue
  static const Color errorIOS = Color(0xFFFF3B30); // iOS error red
  static const Color errorAndroid = Color(0xFFFF6D00); // Android error orange
  static const Color destructiveAction =
      Color(0xFFFF3B30); // iOS destructive red
  static const Color warningAccent = Color(0xFFFF9500); // iOS warning orange

  // Background colors
  static const Color backgroundLight = Color(0xFFFFFFFF); // Pure white
  static const Color backgroundDark =
      Color(0xFF1C1C1E); // iOS dark mode background
  static const Color surfaceElevationLight = Color(0xFFF2F2F7); // Light surface
  static const Color surfaceElevationDark = Color(0xFF2C2C2E); // Dark surface

  // Text colors
  static const Color textPrimaryLight =
      Color(0xFF000000); // High contrast light
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // High contrast dark
  static const Color textSecondaryLight =
      Color(0xFF8E8E93); // iOS secondary light
  static const Color textSecondaryDark =
      Color(0xFF8E8E93); // iOS secondary dark

  // Border and divider colors
  static const Color borderSubtle = Color(0xFFC6C6C8); // Minimal border color
  static const Color dividerLight = Color(0x1F000000);
  static const Color dividerDark = Color(0x1FFFFFFF);

  // Shadow colors
  static const Color shadowLight = Color(0x0A000000); // Minimal shadow (0-4dp)
  static const Color shadowDark = Color(0x0AFFFFFF);

  /// Light theme with authentic system mimicry
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryErrorIOS,
      onPrimary: backgroundLight,
      primaryContainer: primaryErrorIOS,
      onPrimaryContainer: backgroundLight,
      secondary: primaryErrorIOS,
      onSecondary: backgroundLight,
      secondaryContainer: primaryErrorIOS,
      onSecondaryContainer: backgroundLight,
      tertiary: warningAccent,
      onTertiary: backgroundLight,
      tertiaryContainer: warningAccent,
      onTertiaryContainer: backgroundLight,
      error: errorIOS,
      onError: backgroundLight,
      surface: backgroundLight,
      onSurface: textPrimaryLight,
      onSurfaceVariant: textSecondaryLight,
      outline: borderSubtle,
      outlineVariant: dividerLight,
      shadow: shadowLight,
      scrim: shadowLight,
      inverseSurface: backgroundDark,
      onInverseSurface: textPrimaryDark,
      inversePrimary: primaryErrorIOS,
    ),
    scaffoldBackgroundColor: backgroundLight,
    cardColor: surfaceElevationLight,
    dividerColor: borderSubtle,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      foregroundColor: textPrimaryLight,
      elevation: 0,
      shadowColor: shadowLight,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textPrimaryLight,
        letterSpacing: -0.41,
      ),
      toolbarTextStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: primaryErrorIOS,
      ),
    ),
    cardTheme: CardTheme(
      color: surfaceElevationLight,
      elevation: 1.0,
      shadowColor: shadowLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundLight,
      selectedItemColor: primaryErrorIOS,
      unselectedItemColor: textSecondaryLight,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryErrorIOS,
      foregroundColor: backgroundLight,
      elevation: 2.0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: backgroundLight,
        backgroundColor: primaryErrorIOS,
        disabledForegroundColor: textSecondaryLight,
        disabledBackgroundColor: surfaceElevationLight,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryErrorIOS,
        disabledForegroundColor: textSecondaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        side: const BorderSide(color: borderSubtle, width: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.41,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryErrorIOS,
        disabledForegroundColor: textSecondaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.41,
        ),
      ),
    ),
    textTheme: _buildTextTheme(isLight: true),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: backgroundLight,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderSubtle, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderSubtle, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: primaryErrorIOS, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorIOS, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorIOS, width: 1.0),
      ),
      labelStyle: GoogleFonts.inter(
        color: textSecondaryLight,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textSecondaryLight,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return backgroundLight;
        }
        return backgroundLight;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryErrorIOS;
        }
        return borderSubtle;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryErrorIOS;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(backgroundLight),
      side: const BorderSide(color: borderSubtle, width: 0.5),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryErrorIOS;
        }
        return borderSubtle;
      }),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryErrorIOS,
      linearTrackColor: surfaceElevationLight,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryErrorIOS,
      thumbColor: primaryErrorIOS,
      overlayColor: primaryErrorIOS.withValues(alpha: 0.1),
      inactiveTrackColor: borderSubtle,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: primaryErrorIOS,
      unselectedLabelColor: textSecondaryLight,
      indicatorColor: primaryErrorIOS,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.41,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.41,
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: textPrimaryLight.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      textStyle: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: textPrimaryLight,
      contentTextStyle: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      actionTextColor: primaryErrorIOS,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
    ), dialogTheme: DialogThemeData(backgroundColor: backgroundLight),
  );

  /// Dark theme with authentic system mimicry
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primaryErrorIOS,
      onPrimary: textPrimaryLight,
      primaryContainer: primaryErrorIOS,
      onPrimaryContainer: textPrimaryLight,
      secondary: primaryErrorIOS,
      onSecondary: textPrimaryLight,
      secondaryContainer: primaryErrorIOS,
      onSecondaryContainer: textPrimaryLight,
      tertiary: warningAccent,
      onTertiary: textPrimaryLight,
      tertiaryContainer: warningAccent,
      onTertiaryContainer: textPrimaryLight,
      error: errorIOS,
      onError: backgroundLight,
      surface: backgroundDark,
      onSurface: textPrimaryDark,
      onSurfaceVariant: textSecondaryDark,
      outline: borderSubtle,
      outlineVariant: dividerDark,
      shadow: shadowDark,
      scrim: shadowDark,
      inverseSurface: backgroundLight,
      onInverseSurface: textPrimaryLight,
      inversePrimary: primaryErrorIOS,
    ),
    scaffoldBackgroundColor: backgroundDark,
    cardColor: surfaceElevationDark,
    dividerColor: borderSubtle,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      foregroundColor: textPrimaryDark,
      elevation: 0,
      shadowColor: shadowDark,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textPrimaryDark,
        letterSpacing: -0.41,
      ),
      toolbarTextStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: primaryErrorIOS,
      ),
    ),
    cardTheme: CardTheme(
      color: surfaceElevationDark,
      elevation: 1.0,
      shadowColor: shadowDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
      selectedItemColor: primaryErrorIOS,
      unselectedItemColor: textSecondaryDark,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryErrorIOS,
      foregroundColor: backgroundLight,
      elevation: 2.0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: backgroundLight,
        backgroundColor: primaryErrorIOS,
        disabledForegroundColor: textSecondaryDark,
        disabledBackgroundColor: surfaceElevationDark,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryErrorIOS,
        disabledForegroundColor: textSecondaryDark,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        side: const BorderSide(color: borderSubtle, width: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.41,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryErrorIOS,
        disabledForegroundColor: textSecondaryDark,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.41,
        ),
      ),
    ),
    textTheme: _buildTextTheme(isLight: false),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: backgroundDark,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderSubtle, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderSubtle, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: primaryErrorIOS, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorIOS, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorIOS, width: 1.0),
      ),
      labelStyle: GoogleFonts.inter(
        color: textSecondaryDark,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textSecondaryDark,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return backgroundLight;
        }
        return backgroundLight;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryErrorIOS;
        }
        return borderSubtle;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryErrorIOS;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(backgroundLight),
      side: const BorderSide(color: borderSubtle, width: 0.5),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryErrorIOS;
        }
        return borderSubtle;
      }),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryErrorIOS,
      linearTrackColor: surfaceElevationDark,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryErrorIOS,
      thumbColor: primaryErrorIOS,
      overlayColor: primaryErrorIOS.withValues(alpha: 0.1),
      inactiveTrackColor: borderSubtle,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: primaryErrorIOS,
      unselectedLabelColor: textSecondaryDark,
      indicatorColor: primaryErrorIOS,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.41,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.41,
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: textPrimaryDark.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      textStyle: GoogleFonts.inter(
        color: backgroundDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: textPrimaryDark,
      contentTextStyle: GoogleFonts.inter(
        color: backgroundDark,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      actionTextColor: primaryErrorIOS,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
    ), dialogTheme: DialogThemeData(backgroundColor: backgroundDark),
  );

  /// Helper method to build text theme based on brightness using Inter font
  static TextTheme _buildTextTheme({required bool isLight}) {
    final Color textPrimary = isLight ? textPrimaryLight : textPrimaryDark;
    final Color textSecondary =
        isLight ? textSecondaryLight : textSecondaryDark;

    return TextTheme(
      // Display styles - Large headings
      displayLarge: GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.41,
        height: 1.12,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.36,
        height: 1.14,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.26,
        height: 1.18,
      ),

      // Headline styles - Section headings
      headlineLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.45,
        height: 1.2,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.41,
        height: 1.29,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.24,
        height: 1.33,
      ),

      // Title styles - Card titles, dialog titles
      titleLarge: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.41,
        height: 1.29,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: -0.32,
        height: 1.31,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: -0.24,
        height: 1.33,
      ),

      // Body styles - Main content text
      bodyLarge: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        letterSpacing: -0.41,
        height: 1.29,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        letterSpacing: -0.32,
        height: 1.31,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        letterSpacing: -0.24,
        height: 1.33,
      ),

      // Label styles - Buttons, form labels, captions
      labelLarge: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.41,
        height: 1.29,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: -0.08,
        height: 1.38,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.07,
        height: 1.45,
      ),
    );
  }
}
