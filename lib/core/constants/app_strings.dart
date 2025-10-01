//All app strings are placed here

class AppStrings {
  AppStrings._();

  // APP GENERAL
  static const String appName = 'SkillSwap';
  static const String appTagline = 'Learn, share, and grow with your peers';
  static const String fontFamily = 'Inter';

  // ONBOARDING SCREEN
  static const String onboardingTitle =
      'Teach what you\nknow.\nLearn what you\nneed.\nExchange skills.';
  static const String onboardingSubtitle = 'Exchange skills.';
  static const String onboardingGetStarted = 'Get Started';

  // AUTHENTICATION
  static const String welcomeToSkillSwap = 'Welcome to SkillSwap';
  static const String learnShareGrow = 'Learn, share, and grow with your peers';

  // Login Screen
  static const String login = 'Log In';
  static const String loginTitle = 'Welcome Back!';
  static const String emailAddress = 'Email address';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String signUpHere = 'Sign up here';
  static const String signingIn = 'Signing in...';

  // Signup Screen
  static const String signUp = 'Sign Up';
  static const String createAccount = 'Create Your Account';
  static const String username = 'Username';
  static const String confirmPassword = 'Confirm Password';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String loginHere = 'Log in here';
  static const String agreeToTerms = 'By continuing, you agree to our ';
  static const String termsOfService = 'Terms of Service';
  static const String and = ' and ';
  static const String privacyPolicy = 'Privacy Policy';

  // EXPLORE SCREEN
  static const String explore = 'Explore';

  // SESSIONS SCREEN
  static const String sessions = 'Sessions';

  // WALLET SCREEN
  static const String wallet = 'Wallet';

  // PROFILE SCREEN
  static const String profile = 'Profile';

  // SKILL DETAILS SCREEN
  static const String skillDetails = 'Skill Details';
  static const String reviews = 'Reviews'; //mitchel added this

  // ERROR MESSAGES
  static const String somethingWentWrong = 'Something went wrong';
  static const String networkError =
      'Network error. Please check your connection';
  static const String serverError = 'Server error. Please try again later';
  static const String sessionExpired = 'Session expired. Please login again';
  static const String unauthorized = 'Unauthorized access';
  static const String notFound = 'Resource not found';
  static const String connectionTimeout =
      'Connection timeout. Please try again';
  static const String noInternet = 'No internet connection';
  static const String errorLoadingData = 'Error loading data';
  static const String loginFailed =
      'Login failed. Please check your credentials';
  static const String signupFailed = 'Sign up failed. Please try again';

  // SUCCESS MESSAGES
  static const String loginSuccess = 'Login successful!';
  static const String signupSuccess = 'Account created successfully!';
  static const String profileUpdated = 'Profile updated successfully';
  static const String skillAdded = 'Skill added successfully';
  static const String sessionBooked = 'Session booked successfully';
  static const String sessionCompleted = 'Session completed successfully';
  static const String paymentSuccessful = 'Payment successful';
  static const String reviewSubmitted = 'Review submitted successfully';
  static const String passwordResetSent =
      'Password reset link sent to your email';

  // EMPTY STATES
  static const String noSkillsFound = 'No skills found';
  static const String noSessionsYet = 'No sessions yet';
  static const String noTransactions = 'No transactions yet';
  static const String noReviews = 'No reviews yet';
  static const String noNotifications = 'No notifications';
  static const String beFirstToReview = 'Be the first to review';
  static const String startExploring = 'Start exploring skills';
  static const String addYourFirstSkill = 'Add your first skill';

  // CONFIRMATION DIALOGS
  static const String confirmLogout = 'Are you sure you want to logout?';
  static const String confirmDelete = 'Are you sure you want to delete this?';
  static const String confirmCancel = 'Are you sure you want to cancel?';
  static const String confirmEndSession =
      'Are you sure you want to end this session?';
  static const String unsavedChanges =
      'You have unsaved changes. Do you want to save?';
}
