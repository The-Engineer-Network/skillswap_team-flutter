// Helper functions are defined here
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class Helpers {
  Helpers._();

  // DATE & TIME HELPERS
  /// Format date to readable string (e.g., "2 hours ago", "Yesterday")
  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        }
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? "min" : "mins"} ago';
      }
      return '${difference.inHours} ${difference.inHours == 1 ? "hour" : "hours"} ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? "week" : "weeks"} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? "month" : "months"} ago';
    } else {
      return DateFormat('MMM dd, yyyy').format(date);
    }
  }

  /// Format session duration (e.g., "45 min", "1.5 hrs")
  static String formatDuration(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) {
      return '$hours ${hours == 1 ? "hour" : "hours"}';
    }
    return '$hours ${hours == 1 ? "hr" : "hrs"} $remainingMinutes min';
  }

  /// Format time for session display (e.g., "3:30 PM")
  static String formatSessionTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }

  /// Format date for session booking (e.g., "Mon, Jan 15")
  static String formatBookingDate(DateTime date) {
    return DateFormat('EEE, MMM d').format(date);
  }

  /// Get greeting based on time of day
  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }


  // STRING HELPERS
  /// Capitalize first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitalize each word (for names)
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) => capitalize(word)).join(' ');
  }

  /// Truncate text with ellipsis
  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Get initials from name (e.g., "John Doe" -> "JD")
  static String getInitials(String name) {
    final parts = name.trim().split(' ').where((part) => part.isNotEmpty).toList();
    if (parts.isEmpty) return '';
    if (parts.length == 1) {
      return parts[0].substring(0, parts[0].length.clamp(0, 2)).toUpperCase();
    }
    return '${parts[0][0]}${parts.last[0]}'.toUpperCase();
  }

  /// Format phone number (e.g., "(123) 456-7890")
  static String formatPhoneNumber(String phoneNumber) {
    final cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }
    return phoneNumber;
  }

  // NUMBER HELPERS
  /// Format credits (e.g., 12 -> "12 Credits", 1 -> "1 Credit")
  static String formatCredits(int credits) {
    return '$credits ${credits == 1 ? "Credit" : "Credits"}';
  }

  /// Format large numbers (e.g., 1500 -> "1.5K")
  static String formatCompactNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      final result = number / 1000;
      return '${result.toStringAsFixed(result.truncate() == result ? 0 : 1)}K';
    } else if (number < 1000000000) {
      final result = number / 1000000;
      return '${result.toStringAsFixed(result.truncate() == result ? 0 : 1)}M';
    } else {
      final result = number / 1000000000;
      return '${result.toStringAsFixed(result.truncate() == result ? 0 : 1)}B';
    }
  }

  /// Format rating (e.g., 4.5)
  static String formatRating(double rating) {
    if (rating == rating.truncate()) {
      return rating.truncate().toString();
    }
    return rating.toStringAsFixed(1);
  }

  /// Format percentage
  static String formatPercentage(double value, {int decimals = 0}) {
    return '${(value * 100).toStringAsFixed(decimals)}%';
  }


  // VALIDATION HELPERS
  /// Validate email
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email.trim());
  }

  /// Validate phone number
  static bool isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^\d{10}$');
    final cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
    return phoneRegex.hasMatch(cleaned);
  }

  /// Validate username
  static bool isValidUsername(String username) {
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    return usernameRegex.hasMatch(username);
  }


  // UI HELPERS (Dynamic - not const)
  /// Show snackbar with custom styling
  static void showSnackbar(
      BuildContext context,
      String message, {
        bool isError = false,
        bool isSuccess = false,
        Duration duration = const Duration(seconds: 3),
        SnackBarAction? action,
      }) {
    // Get theme info in method
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Determine colors based on type and theme
    Color backgroundColor;
    IconData icon;
    if (isError) {
      backgroundColor = AppColors.error;
      icon = Icons.error_outline;
    } else if (isSuccess) {
      backgroundColor = AppColors.success;
      icon = Icons.check_circle_outline;
    } else {
      backgroundColor = isDark ? AppColors.gray700 : AppColors.gray800;
      icon = Icons.info_outline;
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.all(16),
        action: action,
      ),
    );
  }

  /// Show loading dialog
  static void showLoadingDialog(
      BuildContext context, {
        String? message,
        bool barrierDismissible = false,
      }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => PopScope(
        canPop: true,
        child: AlertDialog(
          backgroundColor: isDark
              ? AppColors.surfaceDark
              : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Row(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDark
                      ? AppColors.primaryPurpleLight
                      : AppColors.primaryPurple,
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Text(
                  message ?? 'Loading...',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Hide loading dialog
  static void hideLoadingDialog(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  /// Show confirmation dialog
  static Future<bool> showConfirmDialog(
      BuildContext context, {
        required String title,
        required String message,
        String confirmText = 'Confirm',
        String cancelText = 'Cancel',
        bool isDestructive = false,
      }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: isDark
            ? AppColors.surfaceDark
            : AppColors.white,
        title: Text(
          title,
          style: AppStyles.h5.copyWith(
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimary,
          ),
        ),
        content: Text(
          message,
          style: AppStyles.bodyMedium.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondary,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              cancelText,
              style: TextStyle(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDestructive
                  ? AppColors.error
                  : (isDark
                  ? AppColors.primaryPurpleLight
                  : AppColors.primaryPurple),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Show bottom sheet
  static void showBottomSheet(
      BuildContext context, {
        required Widget child,
        bool isDismissible = true,
        bool enableDrag = true,
        double? height,
      }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.surfaceDark
              : AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.gray600
                    : AppColors.gray300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }


  // DEVICE HELPERS
  /// Check if keyboard is visible
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  /// Get screen size
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    return getScreenWidth(context) >= 600;
  }

  /// Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return getScreenWidth(context) >= 1024;
  }

  /// Get safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }
}

enum PasswordStrength {
  weak,
  medium,
  strong,
}

