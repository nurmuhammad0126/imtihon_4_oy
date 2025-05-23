import 'package:exam_4/feature/auth/presentation/pages/forget_pasword_screen.dart';
import 'package:exam_4/feature/auth/presentation/pages/login_screen.dart';
import 'package:exam_4/feature/auth/presentation/pages/sign_up_screen.dart';
import 'package:exam_4/feature/auth/presentation/pages/verification_screen.dart';
import 'package:exam_4/feature/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:exam_4/feature/onboarding/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_names.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AppNames.login,
    routes: [
      GoRoute(
        path: AppNames.spalsh,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppNames.onBoading,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: AppNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppNames.forgetPasword,
        builder: (context, state) => const ForgetPaswordScreen(),
      ),
      GoRoute(
        path: AppNames.verification,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: AppNames.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppNames.access,
        builder: (context, state) => const PlaceholderScreen(title: 'Access'),
      ),
      GoRoute(
        path: AppNames.home,
        builder: (context, state) => const PlaceholderScreen(title: 'Home'),
      ),
      GoRoute(
        path: AppNames.cart,
        builder: (context, state) => const PlaceholderScreen(title: 'Cart'),
      ),
      GoRoute(
        path: AppNames.editCart,
        builder:
            (context, state) => const PlaceholderScreen(title: 'Edit Cart'),
      ),
      GoRoute(
        path: AppNames.payment,
        builder: (context, state) => const PlaceholderScreen(title: 'Payment'),
      ),
      GoRoute(
        path: AppNames.map,
        builder: (context, state) => const PlaceholderScreen(title: 'Map'),
      ),
      GoRoute(
        path: AppNames.chat,
        builder: (context, state) => const PlaceholderScreen(title: 'Chat'),
      ),
    ],
  );
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 24))),
    );
  }
}
