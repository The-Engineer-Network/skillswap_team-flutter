//All app styles are defined here
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class AppStyles {
  AppStyles._();

  // TEXT STYLES (Using static colors for const)
  // Headlines
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: AppStrings.fontFamily
  );

  // Labels
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: AppStrings.fontFamily
  );

  // Buttons
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: AppStrings.fontFamily
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: AppStrings.fontFamily
  );

  // Special Styles
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: AppStrings.fontFamily
  );


  // DECORATIONS (Static - light theme default)

  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );


  // DYNAMIC METHODS (For theme-aware styling)

  // Dynamic text styles - use these in build methods
  static TextStyle getH1(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return h1.copyWith(
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
    );
  }

  static TextStyle getH2(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return h2.copyWith(
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
    );
  }

  static TextStyle getH3(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return h3.copyWith(
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
    );
  }

  static TextStyle getBodyLarge(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return bodyLarge.copyWith(
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
    );
  }

  static TextStyle getBodyMedium(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return bodyMedium.copyWith(
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
    );
  }

   static TextStyle getBodySmall(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return bodySmall.copyWith(
      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondary,
    );
  } //mitchel added this

  static TextStyle getCaption(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return caption.copyWith(
      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondary,
    );
  }

  // Dynamic card decoration
  static BoxDecoration getCardDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.cardBackgroundDark : AppColors.cardBackground,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: isDark
              ? Colors.black.withAlpha(77)
              : AppColors.shadowColor,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  // SIZE
  static const double size0 = 0;
  static const double size1 = 1.0;
  static const double size1_5 = 1.5;
  static const double size0_2 = 0.2;
  static const double size4 = 4.0;
  static const double size8 = 8.0;
  static const double size12 = 12.0;
  static const double size13 = 13.0;
  static const double size16 = 16.0;
  static const double size24 = 24.0;
  static const double size32 = 32.0;
  static const double size40 = 40.0;
  static const double size48 = 48.0;
  static const double size80 = 80.0;
  static const double size100 = 100.0;
  static const double size600 = 600.0;

  // TIME
  static const int time2 = 2;
  static const int time4 = 4;
  static const int time8 = 8;

  // BORDER RADIUS
  static const double radius4 = 4.0;
  static const double radius8 = 8.0;
  static const double radius12 = 12.0;
  static const double radius16 = 16.0;
  static const double radius24 = 24.0;
  static const double radius100 = 100.0;
}