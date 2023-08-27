

import 'package:innova/domain/entities/auth/user_login_entity.dart';
import 'package:innova/infraestructure/models/auth/request/login_request.dart';

abstract class AuthDatasource {

  /// Calls the endpoint to login the user
  Future<UserLoginEntity> postLogin(LoginRequest login);

}