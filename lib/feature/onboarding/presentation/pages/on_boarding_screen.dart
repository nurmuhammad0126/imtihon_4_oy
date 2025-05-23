import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:exam_4/feature/onboarding/presentation/pages/on_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    print("\x1B[32m BUILD QURILDI \x1B[0m ");
    return BlocProvider(
      create: (context) => OnBoardingBloc(totalPages: 4),
      child: Scaffold(
        backgroundColor: context.colors.white,
        body: OnBoardingBody(),
      ),
    );
  }
}
