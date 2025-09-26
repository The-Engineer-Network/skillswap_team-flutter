// All formatters are defined here
import 'package:intl/intl.dart';

class Formatters {

  Formatters._();


  // TEXT FORMATTING
  /// Capitalize first letter
  /// Example: "hello" → "Hello"
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitalize each word
  /// Example: "john doe" → "John Doe"
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map((word) => capitalize(word))
        .join(' ');
  }

  /// Shorten long text with ...
  /// Example: "Hello World" with max 5 → "Hello..."
  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Get initials from name
  /// Example: "John Doe" → "JD"
  static String getInitials(String name) {
    name = name.trim();
    if (name.isEmpty) return '';

    List<String> words = name.split(' ');
    if (words.length == 1) {
      // One word: take first 2 letters
      return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
    } else {
      // Multiple words: take first letter of first and last word
      return '${words.first[0]}${words.last[0]}'.toUpperCase();
    }
  }


  // PHONE NUMBER FORMATTING
  /// Format phone: "1234567890" → "(123) 456-7890"
  static String formatPhone(String phone) {
    // Remove all non-digit characters
    String digitsOnly = phone.replaceAll(RegExp(r'[^\d]'), '');

    // Check if it's 10 digits
    if (digitsOnly.length == 10) {
      return '(${digitsOnly.substring(0, 3)}) '
          '${digitsOnly.substring(3, 6)}-'
          '${digitsOnly.substring(6)}';
    }

    // Return as-is if not 10 digits
    return phone;
  }


  // NUMBER FORMATTING
  /// Format credits: 1 → "1 Credit", 5 → "5 Credits"
  static String formatCredits(int credits) {
    if (credits == 1) {
      return '1 Credit';
    } else {
      return '$credits Credits';
    }
  }

  /// Format large numbers: 1500 → "1.5K", 1000000 → "1M"
  static String formatCompactNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      double result = number / 1000;
      if (result == result.truncate()) {
        return '${result.toInt()}K';
      }
      return '${result.toStringAsFixed(1)}K';
    } else {
      double result = number / 1000000;
      if (result == result.truncate()) {
        return '${result.toInt()}M';
      }
      return '${result.toStringAsFixed(1)}M';
    }
  }

  /// Format rating: 4.5 → "4.5", 4.0 → "4"
  static String formatRating(double rating) {
    if (rating == rating.truncate()) {
      return rating.toInt().toString();
    }
    return rating.toStringAsFixed(1);
  }

  /// Format percentage: 0.75 → "75%"
  static String formatPercentage(double value) {
    return '${(value * 100).toInt()}%';
  }


  // DATE & TIME FORMATTING
  /// Format date as "2 hours ago", "Yesterday", etc.
  static String formatTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        }
        return '${difference.inMinutes} min ago';
      }
      return '${difference.inHours} ${difference.inHours == 1 ? "hour" : "hours"} ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? "week" : "weeks"} ago';
    } else {
      // Use intl package for date format
      return DateFormat('MMM d, yyyy').format(date);
    }
  }

  /// Format time: DateTime → "3:30 PM"
  static String formatTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }

  /// Format date: DateTime → "Mon, Jan 15"
  static String formatDate(DateTime date) {
    return DateFormat('EEE, MMM d').format(date);
  }

  /// Format full date: DateTime → "January 15, 2024"
  static String formatFullDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  /// Format duration: 90 minutes → "1 hr 30 min"
  static String formatDuration(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    }

    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    if (remainingMinutes == 0) {
      return '$hours ${hours == 1 ? "hour" : "hours"}';
    }

    return '$hours ${hours == 1 ? "hr" : "hrs"} $remainingMinutes min';
  }
}