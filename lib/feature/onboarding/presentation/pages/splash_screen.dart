import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/routes/app_names.dart';
import 'package:exam_4/core/service/user_local_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_) async {
      final res = await UserLocalService().hasUser();
      if (mounted) {
        res ? context.go(AppNames.mainScreen) : context.go(AppNames.onBoading);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Center(
        child: Image.asset(context.images.logo),
      ).paddingSymmetric(horizontal: 127.w),
    );
  }
}
