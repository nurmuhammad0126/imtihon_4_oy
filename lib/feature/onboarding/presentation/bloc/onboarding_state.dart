
class OnBoardingState {
  final int currentPage;
  final bool isLastPage;

  OnBoardingState({required this.currentPage, required this.isLastPage});

  OnBoardingState copyWith({int? currentPage, bool? isLastPage}) {
    return OnBoardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}