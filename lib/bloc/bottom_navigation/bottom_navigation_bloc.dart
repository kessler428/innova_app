import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState()) {
    on<OnChangePage>( _onChangePage );
  }

  void _onChangePage( OnChangePage event, Emitter<BottomNavigationState> emit ) {
    state.pageController.animateToPage(
      event.indexPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
    emit( state.copyWith( actualPage: event.indexPage ) );
  }
}
