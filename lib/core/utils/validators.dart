// Validator functions are defined here

class Validators {
  Validators._();

  // EMAIL VALIDATION
  /// Check if email is valid
  /// Example: john@gmail.com ✓  john@gmail ✗
  static bool isValidEmail(String email) {
    // Remove any spaces
    email = email.trim();

    // Check if email has @ and .
    if (!email.contains('@') || !email.contains('.')) {
      return false;
    }

    // Simple email pattern
    final emailPattern = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );

    return emailPattern.hasMatch(email);
  }


  // PASSWORD VALIDATION
  /// Check if password is at least 6 characters
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  /// Check if password is strong (for signup)
  /// Must have: uppercase, lowercase, number
  static bool isStrongPassword(String password) {
    if (password.length < 8) return false;

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasNumber = password.contains(RegExp(r'[0-9]'));

    return hasUppercase && hasLowercase && hasNumber;
  }

  /// Check password strength level
  /// Returns: PasswordStrength.weak, .medium, or .strong
  static PasswordStrength checkPasswordStrength(String password) {
    if (password.length < 6) {
      return PasswordStrength.weak;
    }

    // Count how many requirements are met
    int strength = 0;

    // Check for different character types
    if (password.contains(RegExp(r'[A-Z]'))) strength++; // Has uppercase
    if (password.contains(RegExp(r'[a-z]'))) strength++; // Has lowercase
    if (password.contains(RegExp(r'[0-9]'))) strength++; // Has number
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++; // Has special char
    if (password.length >= 10) strength++; // Is long

    // Determine strength level
    if (strength <= 2) {
      return PasswordStrength.weak;
    } else if (strength == 3) {
      return PasswordStrength.medium;
    } else {
      return PasswordStrength.strong;
    }
  }


  // PHONE NUMBER VALIDATION
  /// Check if phone number is 10 digits
  /// Example: 1234567890 ✓  123456 ✗
  static bool isValidPhone(String phone) {
    // Remove all non-digit characters
    String digitsOnly = phone.replaceAll(RegExp(r'[^\d]'), '');

    // Check if it's exactly 10 digits
    return digitsOnly.length == 10;
  }


  // NAME VALIDATION
  /// Check if name is valid (at least 2 characters)
  static bool isValidName(String name) {
    name = name.trim();
    return name.length >= 2;
  }

  /// Check if username is valid (3-20 chars, letters/numbers/underscore only)
  static bool isValidUsername(String username) {
    username = username.trim();

    // Check length
    if (username.length < 3 || username.length > 20) {
      return false;
    }

    // Check if only contains allowed characters
    final usernamePattern = RegExp(r'^[a-zA-Z0-9_]+$');
    return usernamePattern.hasMatch(username);
  }


  // FORM VALIDATORS (For TextFormField)
  /// Email validator for forms
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(value)) {
      return 'Please enter a valid email';
    }
    return null; // No error
  }

  /// Password validator for forms
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!isValidPassword(value)) {
      return 'Password must be at least 6 characters';
    }
    return null; // No error
  }

  /// Strong password validator for signup
  static String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!isStrongPassword(value)) {
      return 'Password must include uppercase, lowercase, and number';
    }
    return null; // No error
  }

  /// Name validator for forms
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (!isValidName(value)) {
      return 'Name must be at least 2 characters';
    }
    return null; // No error
  }

  /// Phone validator for forms
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!isValidPhone(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null; // No error
  }

  /// Username validator for forms
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (!isValidUsername(value)) {
      return 'Username must be 3-20 characters (letters, numbers, underscore only)';
    }
    return null; // No error
  }

  /// Generic required field validator
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null; // No error
  }
}

// ENUMS
enum PasswordStrength {
  weak,
  medium,
  strong,
}