import 'package:innova/domain/datasources/auth/auth_datasource.dart';
import 'package:innova/domain/entities/auth/user_login_entity.dart';
import 'package:innova/domain/repositories/auth/auth_repository.dart';
import 'package:innova/infraestructure/models/auth/request/login_request.dart';

class AuthRepositoryImpl extends AuthRepository {

  AuthRepositoryImpl(this.authDatasource);

  final AuthDatasource authDatasource;

  @override
  Future<UserLoginEntity> postLogin(LoginRequest login) {
    try {

      return authDatasource.postLogin(login);
      
    } catch(e) {
      rethrow;
    }
  }
  
}