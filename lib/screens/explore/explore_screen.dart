import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/common/custom_app_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {

    // Check if dark mode
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundWhite,

      // Custom App Bar
      appBar: CustomAppBar(
        title: 'Explore',
        showBackButton: false, // No back on home screen
        credits: 250, // Will be gotten from user provider
        onCreditsPressed: () {
          // Navigate to wallet
          context.go(AppRoutes.wallet);
        },
      ),
    );
  }
}
