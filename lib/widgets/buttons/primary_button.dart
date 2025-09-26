//Reusable button
import 'package:flutter/material.dart';
import 'package:skillswap/core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;           // The text shown on the button
  final VoidCallback? onPressed; // What happens when button is pressed
  final bool isLoading;        // Show loading spinner?
  final bool isPrimary;        // True = purple, False = light purple

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    // Check if app is in dark mode
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Check if device is tablet (for bigger buttons on tablets)
    final isTablet = MediaQuery.of(context).size.width >= 600;

    // Choose colors based on button type and theme
    Color backgroundColor;
    Color textColor;

    if (isPrimary) {
      // Primary button - solid purple
      backgroundColor = isDark ? AppColors.primaryPurpleLight : AppColors.primaryPurple;
      textColor = AppColors.white;
    } else {
      // Secondary button - light purple background
      backgroundColor = isDark
          ? AppColors.primaryPurple.withAlpha(50)
          : AppColors.primaryPurpleBackground;
      textColor = isDark ? AppColors.primaryPurpleLight : AppColors.primaryPurple;
    }

    return SizedBox(
      width: double.infinity, // Make button full width
      height: isTablet ? 56 : 50, // Bigger on tablets
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed, // Disable when loading
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          // Make button slightly transparent when disabled
          disabledBackgroundColor: backgroundColor.withAlpha(150),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Rounded corners
          ),
          elevation: 0, // No shadow
        ),
        child: isLoading
            ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(textColor),
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontSize: isTablet ? 18 : 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppStrings.fontFamily
          ),
        ),
      ),
    );
  }
}
