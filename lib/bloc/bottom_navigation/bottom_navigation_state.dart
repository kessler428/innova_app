part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {

  final int actualPage;
  final PageController pageController;

  BottomNavigationState({
    this.actualPage = 0,
    PageController? pageController
  }) : pageController = pageController ?? PageController(initialPage: actualPage);

  BottomNavigationState copyWith({
    int? actualPage,
    PageController? pageController
  }) => BottomNavigationState(
    actualPage: actualPage ?? this.actualPage,
    pageController: pageController ?? this.pageController
  );
  
  @override
  List<Object> get props => [
    actualPage,
    pageController
  ];
}
