part of 'profile_bloc.dart';

class ProfileState extends Equatable {

  final int indexSelected;

  const ProfileState({
    this.indexSelected = 2
  });

  ProfileState copyWith({
    int? indexSelected
  }) {
    return ProfileState(
      indexSelected: indexSelected ?? this.indexSelected
    );
  }
  
  @override
  List<Object> get props => [
    indexSelected
  ];
}
