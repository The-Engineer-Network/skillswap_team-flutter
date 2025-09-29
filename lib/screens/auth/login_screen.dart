import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/helpers.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/custom_text_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Local state (to be replaced with Provider when API is ready)
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    // Navigate to signup
    context.go(AppRoutes.signup);
  }

  Future<void> _handleLogin() async {
    // Validate form
    if (!_formKey.currentState!.validate()) return;

    // Dismiss keyboard
    FocusScope.of(context).unfocus();

    // Show loading
    setState(() {
      _isLoading = true;
    });

    Helpers.showLoadingDialog(context, message: AppStrings.signingIn);

    // Simulate API call delay
    await Future.delayed(Duration(seconds: AppStyles.time2));

    // Hide loading
    if (mounted) {
      Helpers.hideLoadingDialog(context);
    }

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      // Show success message
      Helpers.showSnackbar(context, AppStrings.loginSuccess, isSuccess: true);

      // Navigate to home
      context.go(AppRoutes.explore);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = keyboardHeight > AppStyles.size0;

    // Check if the device is a tablet
    final isTablet = screenWidth >= AppStyles.size600;

    // Get theme
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Responsive values
    final horizontalPadding =
        isTablet ? screenWidth * AppStyles.size0_2 : AppStyles.size24;
    final logoSize = isTablet ? AppStyles.size100 : AppStyles.size80;
    final spacingMultiplier = isTablet ? AppStyles.size1_5 : AppStyles.size1;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Extra spacing when keyboard is closed
                    if (!isKeyboardOpen) SizedBox(height: screenHeight * 0.08),

                    // Logo
                    SizedBox(
                      width: isKeyboardOpen ? logoSize * 0.75 : logoSize,
                      height: isKeyboardOpen ? logoSize * 0.75 : logoSize,
                      child: _buildLogo(isDark),
                    ),

                    SizedBox(height: 32 * spacingMultiplier),

                    // Title and subtitle
                    _buildHeader(context, isTablet, isDark),

                    SizedBox(height: AppStyles.size40 * spacingMultiplier),

                    // Form
                    _buildForm(context, isTablet),

                    SizedBox(height: 32 * spacingMultiplier),

                    // Buttons
                    _buildButtons(context, isTablet, isDark),

                    SizedBox(height: 40 * spacingMultiplier),

                    // Terms and Privacy
                    _buildTermsAndPrivacy(context, isTablet, isDark),

                    // Bottom padding
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

  // Build logo widget
  Widget _buildLogo(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.primaryPurpleLight.withAlpha(77),
            AppColors.primaryPurple.withAlpha(100),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withAlpha(15),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
          ),
          child: Icon(
            Icons.swap_horiz_rounded,
            color: AppColors.white,
            size: 32,
          ),
        ),
      ),
    );
  }

  // Build header section
  Widget _buildHeader(BuildContext context, bool isTablet, bool isDark) {
    return Column(
      children: [
        Text(
          AppStrings.welcomeToSkillSwap,
          style:
              isTablet
                  ? AppStyles.h2.copyWith(
                    color:
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimary,
                  )
                  : AppStyles.h3.copyWith(
                    color:
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimary,
                  ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          AppStrings.learnShareGrow,
          style: AppStyles.bodyMedium.copyWith(
            color:
                isDark ? AppColors.textSecondaryDark : AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Build form section
  Widget _buildForm(BuildContext context, bool isTablet) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextField(
            controller: _emailController,
            hintText: AppStrings.emailAddress,
            textInputAction: TextInputAction.next,
            size: isTablet ? TextFieldSize.large : TextFieldSize.medium,
            showIcon: false,
          ),

          SizedBox(height: 16),

          // Password field
          PasswordTextField(
            controller: _passwordController,
            hintText: AppStrings.password,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _handleLogin(),
            size: isTablet ? TextFieldSize.large : TextFieldSize.medium,
            showIcon: false,
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context, bool isTablet, bool isDark) {
    return Column(
      children: [
        // SIGN UP BUTTON (Purple)
        PrimaryButton(
          text: AppStrings.signUp,
          onPressed: _handleSignUp,
          isPrimary: true, // Makes it purple
        ),

        SizedBox(height: 12),

        // LOGIN BUTTON (Light purple with loading)
        PrimaryButton(
          text: AppStrings.login,
          onPressed: _handleLogin,
          isLoading: _isLoading, // Shows spinner when true
          isPrimary: false, // Makes it light purple
        ),
      ],
    );
  }

  // Build terms and privacy section
  Widget _buildTermsAndPrivacy(
    BuildContext context,
    bool isTablet,
    bool isDark,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.size16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppStyles.caption.copyWith(
            color:
                isDark ? AppColors.textSecondaryDark : AppColors.textSecondary,
            fontSize: isTablet ? AppStyles.size13 : AppStyles.size12,
          ),
          children: [
            TextSpan(text: AppStrings.agreeToTerms),
            TextSpan(
              text: AppStrings.termsOfService,
              style: TextStyle(
                color:
                    isDark
                        ? AppColors.primaryPurpleLight
                        : AppColors.primaryPurple,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Helpers.showSnackbar(context, AppStrings.termsOfService);
                    },
            ),
            TextSpan(text: AppStrings.and),
            TextSpan(
              text: AppStrings.privacyPolicy,
              style: TextStyle(
                color:
                    isDark
                        ? AppColors.primaryPurpleLight
                        : AppColors.primaryPurple,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Helpers.showSnackbar(context, AppStrings.privacyPolicy);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
