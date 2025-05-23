
abstract class OnBoardingEvent {}

class OnBoardingNextPressed extends OnBoardingEvent {}

class OnBoardingPageChanged extends OnBoardingEvent {
  final int pageIndex;
  OnBoardingPageChanged(this.pageIndex);
}
