import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:innova/domain/datasources/auth/auth_datasource.dart';
import 'package:innova/domain/entities/auth/user_login_entity.dart';
import 'package:innova/domain/repositories/auth/auth_repository.dart';
import 'package:innova/infraestructure/datasources/auth/auth_datasource_impl.dart';
import 'package:innova/infraestructure/models/auth/request/login_request.dart';
import 'package:innova/infraestructure/repositories/auth/auth_repository_impl.dart';
import 'package:innova/utils/enums/request_progress_status.dart';
import 'package:innova/utils/helpers/exeptions_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEmailChanged>(_onAuthEmailChanged);
    on<AuthPasswordChanged>(_onAuthPasswordChanged);
    on<AuthLogin>(_onAuthLogin);
    on<ChangeProgressStatusEvent>(_updateProgressStatus);
  }

  void _onAuthEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onAuthPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {

    try {
      AuthDatasource authDataSource = AuthDatasourceImpl();
      AuthRepository authRepository = AuthRepositoryImpl(authDataSource);
      
      LoginRequest loginRequest = LoginRequest(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(progressStatus: RequestProgressStatus.loading));

      final UserLoginEntity userResponse = await authRepository.postLogin(loginRequest);

      emit(state.copyWith(
        user: userResponse,
        progressStatus: RequestProgressStatus.success
      ));
    } catch (e) {
      if (e is ApiException) {
        emit(state.copyWith(
          progressStatus: RequestProgressStatus.error,
          progressStatusMessage: e.message
        ));  
      }else{
        emit(state.copyWith(
          progressStatus: RequestProgressStatus.error,
          progressStatusMessage: e.toString()
        ));
      }
    }
  }

  void _updateProgressStatus(ChangeProgressStatusEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(progressStatus: event.progressStatus,));
  }

  
}
