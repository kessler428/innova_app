part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileEventChangeIndexSelected extends ProfileEvent {
  final int indexSelected;

  const ProfileEventChangeIndexSelected({
    required this.indexSelected
  });

  @override
  List<Object> get props => [indexSelected];
}