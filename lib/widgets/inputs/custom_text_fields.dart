// All text fields are defined here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillswap/core/utils/validators.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';

class CustomTextField extends StatefulWidget {
  // Basic properties
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? initialValue;

  // Input configuration
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool expands;

  // Obscure text (for passwords)
  final bool isPassword;
  final bool? obscureText;

  // Icons
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final VoidCallback? onSuffixTap;

  // Validation and formatting
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final FocusNode? focusNode;

  // Styling
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool filled;
  final bool showBorder;

  // Custom decoration override
  final InputDecoration? customDecoration;

  // Size variants
  final TextFieldSize size;

  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.expands = false,
    this.isPassword = false,
    this.obscureText,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.suffixWidget,
    this.onSuffixTap,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.focusNode,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.contentPadding,
    this.filled = true,
    this.showBorder = false,
    this.customDecoration,
    this.size = TextFieldSize.medium,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? widget.isPassword;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  EdgeInsetsGeometry _getContentPadding() {
    if (widget.contentPadding != null) return widget.contentPadding!;

    final isTablet = MediaQuery.of(context).size.width >= 600;

    switch (widget.size) {
      case TextFieldSize.small:
        return EdgeInsets.symmetric(
          horizontal: 12,
          vertical: isTablet ? 12 : 8,
        );
      case TextFieldSize.large:
        return EdgeInsets.symmetric(
          horizontal: 20,
          vertical: isTablet ? 20 : 16,
        );
      case TextFieldSize.medium:
      return EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isTablet ? 18 : 14,
        );
    }
  }

  TextStyle _getTextStyle() {
    if (widget.textStyle != null) return widget.textStyle!;

    // Get theme-aware text color
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimary;

    switch (widget.size) {
      case TextFieldSize.small:
        return AppStyles.bodySmall.copyWith(color: textColor);
      case TextFieldSize.large:
        return AppStyles.bodyLarge.copyWith(color: textColor);
      case TextFieldSize.medium:
      return AppStyles.bodyMedium.copyWith(color: textColor);
    }
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixWidget != null) return widget.prefixWidget;
    if (widget.prefixIcon != null) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Icon(
        widget.prefixIcon,
        color: _isFocused
            ? (isDark ? AppColors.primaryPurpleLight : AppColors.primaryPurple)
            : (isDark ? AppColors.gray400 : AppColors.iconDefault),
        size: widget.size == TextFieldSize.small ? 18 : 20,
      );
    }
    return null;
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixWidget != null) return widget.suffixWidget;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Password visibility toggle
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: isDark ? AppColors.gray400 : AppColors.iconDefault,
          size: widget.size == TextFieldSize.small ? 18 : 20,
        ),
        onPressed: _togglePasswordVisibility,
      );
    }

    // Custom suffix icon
    if (widget.suffixIcon != null) {
      final icon = Icon(
        widget.suffixIcon,
        color: _isFocused
            ? (isDark ? AppColors.primaryPurpleLight : AppColors.primaryPurple)
            : (isDark ? AppColors.gray400 : AppColors.iconDefault),
        size: widget.size == TextFieldSize.small ? 18 : 20,
      );

      if (widget.onSuffixTap != null) {
        return IconButton(
          icon: icon,
          onPressed: widget.onSuffixTap,
        );
      }

      return icon;
    }

    return null;
  }

  InputDecoration _buildDecoration() {
    // Use custom decoration if provided
    if (widget.customDecoration != null) {
      return widget.customDecoration!;
    }

    // Get theme info
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Dynamic colors based on theme
    final borderRadius = widget.borderRadius ?? 12.0;
    final fillColor = widget.fillColor ??
        (isDark ? AppColors.inputBackgroundDark : AppColors.inputBackground);
    final borderColor = widget.borderColor ??
        (isDark ? AppColors.gray700 : AppColors.inputBorder);
    final focusedBorderColor = widget.focusedBorderColor ??
        (isDark ? AppColors.primaryPurpleLight : AppColors.primaryPurple);
    final errorBorderColor = widget.errorBorderColor ?? AppColors.error;
    final hintColor = isDark ? AppColors.textHintDark : AppColors.textHint;
    final labelColor = _isFocused
        ? focusedBorderColor
        : hintColor;

    return InputDecoration(
      labelText: widget.label,
      hintText: widget.hintText,
      helperText: widget.helperText,
      helperMaxLines: 2,

      // Dynamic styles based on theme
      labelStyle: widget.labelStyle ?? _getTextStyle().copyWith(color: labelColor),
      hintStyle: widget.hintStyle ?? _getTextStyle().copyWith(color: hintColor),
      helperStyle: AppStyles.caption.copyWith(
        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondary,
      ),
      errorStyle: AppStyles.caption.copyWith(color: AppColors.error),

      // Colors
      filled: widget.filled,
      fillColor: widget.enabled
          ? fillColor
          : (isDark ? AppColors.gray800 : AppColors.gray100),

      // Icons
      prefixIcon: _buildPrefixIcon(),
      suffixIcon: _buildSuffixIcon(),

      // Borders
      border: widget.showBorder
          ? OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor, width: 1),
      )
          : OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide.none,
      ),

      enabledBorder: widget.showBorder
          ? OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor, width: 1),
      )
          : OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: focusedBorderColor, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: errorBorderColor, width: 1),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: errorBorderColor, width: 2),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: widget.showBorder
            ? BorderSide(color: isDark ? AppColors.gray700 : AppColors.gray300, width: 1)
            : BorderSide.none,
      ),

      // Padding
      contentPadding: _getContentPadding(),

      // Counter
      counterText: widget.maxLength != null ? null : '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: _getTextStyle(),
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      autocorrect: widget.autocorrect && !widget.isPassword,
      enableSuggestions: widget.enableSuggestions && !widget.isPassword,
      expands: widget.expands,
      obscureText: _obscureText,
      decoration: _buildDecoration(),
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
    );
  }
}

// Text field size variants
enum TextFieldSize { small, medium, large }

// ============================================
// SPECIALIZED TEXT FIELDS
// ============================================

// Email Field
class EmailTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool autofocus;
  final TextFieldSize size;
  final bool showIcon;

  const EmailTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.size = TextFieldSize.medium,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText ?? 'Email address',
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      prefixIcon: showIcon ? Icons.email_outlined : null,
      autocorrect: false,
      enableSuggestions: false,
      autofocus: autofocus,
      size: size,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        if (!Validators.isValidEmail(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

// Password Field
class PasswordTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool autofocus;
  final bool validateStrength;
  final TextFieldSize size;
  final bool showIcon;

  const PasswordTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.validateStrength = false,
    this.size = TextFieldSize.medium,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText ?? 'Password',
      isPassword: true,
      textInputAction: textInputAction,
      prefixIcon: showIcon ? Icons.lock_outline : null,
      autofocus: autofocus,
      size: size,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (validateStrength) {
          final strength = Validators.checkPasswordStrength(value);
          if (strength == PasswordStrength.weak) {
            return 'Password is too weak. Use uppercase, lowercase, numbers, and symbols';
          }
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

// Search Field
class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final TextFieldSize size;

  const SearchTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.size = TextFieldSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText ?? 'Search for skills',
      prefixIcon: Icons.search,
      suffixIcon: controller?.text.isNotEmpty == true ? Icons.clear : null,
      onSuffixTap: () {
        controller?.clear();
        onClear?.call();
      },
      textInputAction: TextInputAction.search,
      size: size,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}