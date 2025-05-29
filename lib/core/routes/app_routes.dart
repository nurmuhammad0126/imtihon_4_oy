import 'package:exam_4/feature/auth/presentation/pages/access_location.dart';
import 'package:exam_4/feature/cart/presentation/pages/cart_screen.dart';
import 'package:exam_4/feature/cart/presentation/pages/congratulations_screen.dart';
import 'package:exam_4/feature/home/presentation/pages/home_product_detail_screen.dart';
import 'package:exam_4/feature/home/presentation/pages/home_screen.dart';
import 'package:exam_4/feature/main_screen.dart';
import 'package:exam_4/feature/map/presentation/pages/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../feature/auth/presentation/pages/forget_pasword_screen.dart';
import '../../feature/auth/presentation/pages/login_screen.dart';
import '../../feature/auth/presentation/pages/sign_up_screen.dart';
import '../../feature/auth/presentation/pages/verification_screen.dart';
import '../../feature/onboarding/presentation/pages/on_boarding_screen.dart';
import '../../feature/onboarding/presentation/pages/splash_screen.dart';
import 'app_names.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AppNames.splash,
    routes: [
      _animatedRoute(AppNames.splash, const SplashScreen()),
      _animatedRoute(AppNames.congratulations, const CongratulationsScreen()),

      _animatedRoute(AppNames.onBoading, const OnBoardingScreen()),
      _animatedRoute(AppNames.login, const LoginScreen()),
      _animatedRoute(AppNames.forgetPasword, const ForgetPaswordScreen()),
      _animatedRoute(AppNames.verification, const VerificationScreen()),
      _animatedRoute(AppNames.signUp, const SignUpScreen()),
      _animatedRoute(AppNames.access, const PlaceholderScreen(title: 'Access')),
      _animatedRoute(AppNames.home, const HomeScreen()),
      _animatedRoute(AppNames.homeDetail, const HomeProductDetailScreen()),
      _animatedRoute(AppNames.accesLocation, const AccessLocationScreen()),
      _animatedRoute(AppNames.mainScreen, const MainScreen()),
      _animatedRoute(AppNames.mapScreen, const MapScreen()),

      _animatedRoute(AppNames.cart, CartScreen()),
      _animatedRoute(
        AppNames.editCart,
        const PlaceholderScreen(title: 'Edit Cart'),
      ),
      _animatedRoute(
        AppNames.payment,
        const PlaceholderScreen(title: 'Payment'),
      ),
      _animatedRoute(AppNames.map, const PlaceholderScreen(title: 'Map')),
      _animatedRoute(AppNames.chat, const PlaceholderScreen(title: 'Chat')),
    ],
  );

  static GoRoute _animatedRoute(String path, Widget screen) {
    return GoRoute(
      path: path,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: screen,
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(1, 0);
              const end = Offset.zero;
              final tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: Curves.easeInOut));
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
    );
  }
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
