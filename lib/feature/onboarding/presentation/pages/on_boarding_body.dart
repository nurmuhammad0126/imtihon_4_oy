import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/routes/app_names.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_rounded_container.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> pages = const [
    {
      "title": "All your favorites",
      "desc":
          "Get all your loved foods in one once place, you just place the order we do the rest",
    },
    {
      "title": "All your favorites",
      "desc":
          "Get all your loved foods in one once place, you just place the order we do the rest",
    },
    {
      "title": "Order from chosen chef",
      "desc":
          "Get all your loved foods in one once place, you just place the order we do the rest",
    },
    {
      "title": "Free delivery offers",
      "desc":
          "Get all your loved foods in one once place, you just place the order we do the rest",
    },
  ];

  void nextPage(BuildContext context) {
    final bloc = context.read<OnBoardingBloc>();
    final currentPage = bloc.state.currentPage;

    if (currentPage < pages.length - 1) {
      bloc.add(OnBoardingNextPressed());
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 800),
        curve: Curves.decelerate,
      );
    } else {
      context.go(AppNames.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<OnBoardingBloc, OnBoardingState>(
          buildWhen:
              (previous, current) =>
                  previous.currentPage != current.currentPage ||
                  previous.isLastPage != current.isLastPage,
          builder: (context, state) {
            return Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  context.read<OnBoardingBloc>().add(
                    OnBoardingPageChanged(index),
                  );
                },
                itemBuilder:
                    (context, index) => Column(
                      children: [
                        WRoundedContainer(
                          color: context.colors.blueGray,
                          child: SizedBox(
                            width: double.infinity,
                            height: 340.h,
                          ),
                        ).paddingOnly(top: 114.h, left: 68.w, right: 67.w),
                        Text(
                          pages[index]['title']!,
                          style: context.styles.s22w800,
                        ).paddingSymmetric(horizontal: 25.o, vertical: 18.o),
                        Text(
                          pages[index]['desc']!,
                          textAlign: TextAlign.center,
                          style: context.styles.s16w400.copyWith(
                            color: context.colors.gray,
                          ),
                        ).paddingSymmetric(horizontal: 26.w),
                      ],
                    ),
              ),
            );
          },
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: pages.length,
          effect: WormEffect(
            dotWidth: 10.o,
            dotHeight: 10.h,
            dotColor: context.colors.lightOrange,
            activeDotColor: context.colors.orange,
          ),
        ).paddingOnly(top: 32.h),
        40.height,
        BlocBuilder<OnBoardingBloc, OnBoardingState>(
          buildWhen:
              (previous, current) => previous.isLastPage != current.isLastPage,
          builder:
              (context, state) => WButton(
                width: double.infinity,
                height: 65.h,
                color: context.colors.orange,
                borderRadius: 12.o,
                onTap: () => nextPage(context),
                child: Center(
                  child: Text(
                    state.isLastPage ? "Get Started" : "Next",
                    style: context.styles.s14w700.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 24.w),
        ),
        BlocBuilder<OnBoardingBloc, OnBoardingState>(
          buildWhen:
              (previous, current) => previous.isLastPage != current.isLastPage,
          builder:
              (context, state) => TextButton(
                onPressed:
                    state.isLastPage ? null : () => context.go(AppNames.login),
                child: Text(
                  state.isLastPage ? "" : "Skip",
                  style: context.styles.s16w400.copyWith(
                    color: context.colors.gray,
                  ),
                ),
              ).paddingOnly(bottom: 40.h, top: 16.h),
        ),
      ],
    );
  }
}
