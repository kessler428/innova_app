part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthEmailChanged extends AuthEvent {
  final String email;

  const AuthEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class AuthPasswordChanged extends AuthEvent {
  final String password;

  const AuthPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class AuthLogin extends AuthEvent {}

class ChangeProgressStatusEvent extends AuthEvent {
  final RequestProgressStatus progressStatus;

  const ChangeProgressStatusEvent({required this.progressStatus});

  @override
  List<Object> get props => [progressStatus];
}
