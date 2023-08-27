import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {

  final int id;
  final String userName;
  final String accessToken;

  const UserLoginEntity({
    required this.id,
    required this.userName,
    required this.accessToken,
  });

    /// Returns a [UserEntity] object with default properties
  const UserLoginEntity.empty() : this(
    id: 0,
    userName: '',
    accessToken: '',
  );

  @override
  List<Object?> get props => [
    id,
    userName,
    accessToken,
  ];

}