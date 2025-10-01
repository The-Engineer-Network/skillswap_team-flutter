import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/helpers.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/custom_text_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Form key and controllers
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  bool _isLoading = false; // Local loading state

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    // Validate form
    if (!_formKey.currentState!.validate()) return;

    // Close keyboard
    FocusScope.of(context).unfocus();

    setState(() => _isLoading = true);

    Helpers.showLoadingDialog(context, message: AppStrings.signUp);

    // Simulate API call
    await Future.delayed(Duration(seconds: AppStyles.time2));

    if (mounted) {
      Helpers.hideLoadingDialog(context);
    }

    if (mounted) {
      setState(() => _isLoading = false);

      // Success feedback
      Helpers.showSnackbar(context, AppStrings.signupSuccess, isSuccess: true);

      // Navigate to Explore/Home
      context.go(AppRoutes.explore);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width >= AppStyles.size600;

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.icon(context)),
          onPressed: () {
            // Navigate to login page
            context.go(AppRoutes.login);
          },
        ),
        title: Text(
          AppStrings.signUp,
          style: AppStyles.h4.copyWith(
            color: AppColors.text1(context),
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppStyles.size24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.05),

                // Title text
                Text(
                  AppStrings.onboardingTitle,
                  style:
                      isTablet
                          ? AppStyles.h2.copyWith(
                            color: AppColors.text1(context),
                          )
                          : AppStyles.h3.copyWith(
                            color: AppColors.text1(context),
                          ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: AppStyles.size8),

                // Subtitle
                Text(
                  AppStrings.onboardingSubtitle,
                  style: AppStyles.bodyMedium.copyWith(
                    color: AppColors.text2(context),
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: AppStyles.size40),

                // Email
                EmailTextField(
                  controller: _emailController,
                  hintText: AppStrings.emailAddress,
                  textInputAction: TextInputAction.next,
                  size: isTablet ? TextFieldSize.large : TextFieldSize.medium,
                  showIcon: false,
                ),

                SizedBox(height: AppStyles.size16),

                // Password
                PasswordTextField(
                  controller: _passwordController,
                  hintText: AppStrings.password,
                  textInputAction: TextInputAction.next,
                  size: isTablet ? TextFieldSize.large : TextFieldSize.medium,
                  showIcon: false,
                ),

                SizedBox(height: AppStyles.size16),

                // Confirm Password
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: AppStrings.confirmPassword,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  size: isTablet ? TextFieldSize.large : TextFieldSize.medium,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password required";
                    }
                    if (value != _passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                SizedBox(height: AppStyles.size16),

                // Username
                CustomTextField(
                  controller: _usernameController,
                  hintText: AppStrings.username,
                  textInputAction: TextInputAction.done,
                  size: isTablet ? TextFieldSize.large : TextFieldSize.medium,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? "Username required"
                              : null,
                ),

                SizedBox(height: AppStyles.size24),

                // Sign Up button
                PrimaryButton(
                  text: AppStrings.signUp,
                  onPressed: _handleSignup,
                  isLoading: _isLoading,
                  isPrimary: true,
                ),

                SizedBox(height: AppStyles.size24),

                // Already have an account?
                GestureDetector(
                  onTap: () => context.go(AppRoutes.login),
                  child: Text(
                    "${AppStrings.alreadyHaveAccount} ${AppStrings.loginHere}",
                    style: AppStyles.bodySmall.copyWith(
                      color: AppColors.primary(context),
                    ),
                  ),
                ),

                SizedBox(height: AppStyles.size16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
