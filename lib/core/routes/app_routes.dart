// App routes are defined here
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Used for ChangeNotifierProvider
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/signup_screen.dart';
import '../../screens/explore/explore_screen.dart';
import '../../screens/main_navigation_screen.dart';
import '../../screens/onboarding/onboarding.dart';
import '../../screens/profile/edit_profile_screen.dart';
import '../../screens/sessions/sessions_screen.dart';
import '../../screens/wallet/wallet_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/profile/skill_detail.dart';

class AppRoutes {
  // Route paths
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String explore = '/explore';
  static const String sessions = '/sessions';
  static const String wallet = '/wallet';
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String skillDetail = '/skill/:id';
  static const String liveSession = '/session/live/:id';

  static final GoRouter router = GoRouter(
    initialLocation: skillDetail,
    debugLogDiagnostics: true,
    // TODO: Add authentication logic when AuthProvider is ready
    // redirect: (BuildContext context, GoRouterState state) {
    //   // Check authentication status
    //   // Redirect to login if not authenticated
    //   // Redirect to home if authenticated and trying to access auth routes
    //   return null;
    // },
    routes: [
      // Auth Routes (No Bottom Nav)
      GoRoute(
        path: onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(path: login, builder: (context, state) => LoginScreen()),
      GoRoute(path: signup, builder: (context, state) => SignupScreen()),

      // Main App with Bottom Navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainNavigationScreen(child: child);
        },
        routes: [
          GoRoute(
            path: explore,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: ExploreScreen(),
                ),
          ),
          GoRoute(
            path: sessions,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: SessionsScreen(),
                ),
          ),
          GoRoute(
            path: wallet,
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(key: state.pageKey, child: WalletScreen()),
          ),
          GoRoute(
            path: profile,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: ProfileScreen(),
                ),
          ),
        ],
      ),

      // Standalone Routes (Full screen, no bottom nav)
      GoRoute(
        path: editProfile,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: skillDetail,
        builder: (context, state) {
          final skillId = state.pathParameters['id']!;
          return ChangeNotifierProvider(
                create: (_) => SkillDetailProvider(),
                child: SkillDetailScreen(skillId: skillId),
              ) ??
              const SizedBox(); // Added fallback to satisfy analyzer
        },
      ),
      // TODO: Uncomment when LiveSessionScreen is implemented
      // GoRoute(
      //   path: liveSession,
      //   builder: (context, state) {
      //     final sessionId = state.pathParameters['id']!;
      //     return LiveSessionScreen(sessionId: sessionId);
      //   },
      // ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                SizedBox(height: 16),
                Text('Page not found'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.go(explore),
                  child: Text('Go to Home'),
                ),
              ],
            ),
          ),
        ),
  );
}
