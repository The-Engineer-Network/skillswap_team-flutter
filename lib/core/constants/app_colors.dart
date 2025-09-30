//All app colors are defined here
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // STATIC COLORS FOR CONST CONTEXTS
  // Primary colors (use these in const constructors)
  static const Color primaryPurple = Color(0xFF7B2FD0);
  static const Color primaryPurpleLight = Color(0xFF9C4FE0);
  static const Color primaryPurpleDark = Color(0xFF5A1FA0);
  static const Color primaryPurpleBackground = Color(0xFFF3EEFF);
  static const Color primaryPurpleAccent = Color(0xFFE6D9FF);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryPurple, primaryPurpleLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color darkRose = Color.fromRGBO(109, 82, 89, 1);
  static const Color deepTeal = Color.fromRGBO(48, 93, 92, 1);
  static const Color plumPurple1 = Color.fromRGBO(105, 60, 115, 1);
  static const Color plumPurple2 = Color.fromRGBO(105, 60, 115, 1);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color backgroundWhite = Color(0xFFFAFAFA);
  static const Color surfaceWhite = Color(0xFFF5F5F5);

  // Grays
  static const Color gray900 = Color(0xFF212121);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray50 = Color(0xFFFAFAFA);

  // Text colors - Light (default for const)
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Component colors
  static const Color cardBackground = white;
  static const Color cardBorder = gray200;
  static const Color divider = gray300;
  static const Color inputBackground = gray100;
  static const Color inputBorder = gray300;
  static const Color inputBorderFocused = primaryPurple;
  static const Color iconDefault = gray600;
  static const Color iconActive = primaryPurple;
  static const Color shadowColor = Color(0x1A000000);

  // Dark theme specific
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color cardBackgroundDark = Color(0xFF1E1E1E);
  static const Color inputBackgroundDark = Color(0xFF2C2C2C);
  static const Color textPrimaryDark = Color(0xFFE0E0E0);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textHintDark = Color(0xFF757575);

  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFFE8F5E9);
  static const Color successDark = Color(0xFF2E7D32);
  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color errorDark = Color(0xFFC62828);
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFF3E0);
  static const Color warningDark = Color(0xFFE65100);
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFFE3F2FD);
  static const Color infoDark = Color(0xFF1565C0);

  // Category colors
  static const Color categoryBusiness = Color(0xFF673AB7);

  // THEME-AWARE METHODS (Use in build methods only)
  static Color primary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? primaryPurple
        : primaryPurpleLight;
  }

  static Color background(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? backgroundWhite
        : backgroundDark;
  }

  static Color surface(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? surfaceWhite
        : surfaceDark;
  }

  static Color card(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? cardBackground
        : cardBackgroundDark;
  }

  static Color text1(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? textPrimary
        : textPrimaryDark;
  }

  static Color text2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? textSecondary
        : textSecondaryDark;
  }

  static Color hint(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? textHint
        : textHintDark;
  }

  static Color inputBg(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? inputBackground
        : inputBackgroundDark;
  }

  static Color icon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? iconDefault
        : gray400;
  }

  static Color dividerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? divider
        : Color(0xFF2C2C2C);
  }
}
