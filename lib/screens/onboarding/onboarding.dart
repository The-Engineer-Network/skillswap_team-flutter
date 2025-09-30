import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../core/constants/app_strings.dart';

import '../../core/routes/app_routes.dart';
import '../../widgets/buttons/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    // Check if the device is a tablet
    final isTablet = screenWidth >= AppStyles.size600;

    // Responsive values
    final horizontalPadding =
        isTablet ? screenWidth * AppStyles.size0_2 : AppStyles.size24;
    final spacingMultiplier = isTablet ? AppStyles.size1_5 : AppStyles.size1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.darkRose, // Dark Rose (biggest)
              AppColors.deepTeal, // Deep Teal (smallest)
              AppColors.plumPurple1, // Plum Purple 1
              AppColors.plumPurple2, // Plum Purple 2 (second biggest)
            ],
            stops: [0.3, 0.55, 0.7, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500, // Maximum width for tablets
                  minHeight:
                      screenHeight -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.onboardingTitle,
                      style:
                          isTablet
                              ? AppStyles.h1.copyWith(
                                color: AppColors.textPrimaryDark,
                              )
                              : AppStyles.h2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 37,
                                color: AppColors.textPrimaryDark,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40 * spacingMultiplier),

                    PrimaryButton(
                      buttonColor: AppColors.primaryPurpleLight,
                      buttonHeight: 65,
                      fontSize: 18,
                      text: AppStrings.onboardingGetStarted,
                      onPressed: _handleContinue,
                      isPrimary: true, // Makes it purple
                    ),
                    SizedBox(height: AppStyles.size24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleContinue() {
    context.push(AppRoutes.login);
  }
}
