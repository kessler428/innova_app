part of 'auth_bloc.dart';


class AuthState extends Equatable {

  final String email;
  final String password;
  final bool isAuthenticated;

  final RequestProgressStatus progressStatus;
  final String progressStatusMessage;
  final UserLoginEntity user;
  

  const AuthState({
    this.email = '',
    this.password = '',
    this.isAuthenticated = false,
    this.progressStatus = RequestProgressStatus.nothing,
    this.progressStatusMessage = '',
    this.user = const UserLoginEntity.empty(),
  });

  AuthState copyWith({
    String? email,
    String? password,
    bool? isAuthenticated,
    RequestProgressStatus? progressStatus,
    String? progressStatusMessage,
    UserLoginEntity? user,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      progressStatus: progressStatus ?? this.progressStatus,
      progressStatusMessage: progressStatusMessage ?? this.progressStatusMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isAuthenticated,
    progressStatus,
    progressStatusMessage,
    user,
  ];
}

