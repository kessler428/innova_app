part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class OnChangePage extends BottomNavigationEvent {
  final int indexPage;

  const OnChangePage(this.indexPage);

  @override
  List<Object> get props => [indexPage];
}
