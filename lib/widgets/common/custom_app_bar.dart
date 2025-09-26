// Reusable custom app bar
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Required
  final String title;

  // Optional
  final bool showBackButton;
  final bool showCredits;
  final int credits;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCreditsPressed;
  final List<Widget>? actions; // For additional action buttons
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showCredits = true,
    this.credits = 0,
    this.onBackPressed,
    this.onCreditsPressed,
    this.actions,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.0); // Standard app bar height

  @override
  Widget build(BuildContext context) {
    // Check if dark mode
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Check if we can pop (have a previous screen)
    final canPop = Navigator.canPop(context);

    return AppBar(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.white,
      elevation: 0, // No shadow for clean look
      centerTitle: centerTitle,

      // System UI overlay style (status bar icons color)
      systemOverlayStyle: isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,

      // Back button or menu
      leading: showBackButton && canPop
          ? IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
        ),
        onPressed: onBackPressed ?? () => Navigator.pop(context),
      )
          : null,

      // Disable automatic back button
      automaticallyImplyLeading: false,

      // Title
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
        ),
      ),

      // Right side actions
      actions: [
        // Credits chip
        if (showCredits) ...[
          _buildCreditsChip(context, isDark),
          SizedBox(width: 16),
        ],

        // Additional custom actions
        if (actions != null) ...actions!,
      ],
    );
  }

  // Build the credits chip widget
  Widget _buildCreditsChip(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: onCreditsPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.primaryPurple.withAlpha(50)
              : AppColors.primaryPurpleBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 16,
              color: AppColors.primaryPurple,
            ),
            SizedBox(width: 4),
            Text(
              credits.toString(),
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// SIMPLE VERSION WITHOUT CREDITS
class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const SimpleAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      showCredits: false,
      actions: actions,
    );
  }
}