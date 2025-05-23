import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final int totalPages;

  OnBoardingBloc({required this.totalPages})
      : super(OnBoardingState(currentPage: 0, isLastPage: false)) {
    on<OnBoardingNextPressed>((event, emit) {
      final nextPage = state.currentPage + 1;
      if (nextPage < totalPages) {
        emit(state.copyWith(
          currentPage: nextPage,
          isLastPage: nextPage == totalPages - 1,
        ));
      }
    });

    on<OnBoardingPageChanged>((event, emit) {
      emit(state.copyWith(
        currentPage: event.pageIndex,
        isLastPage: event.pageIndex == totalPages - 1,
      ));
    });
  }
}
