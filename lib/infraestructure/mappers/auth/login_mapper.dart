import 'package:innova/domain/entities/auth/user_login_entity.dart';
import 'package:innova/infraestructure/models/auth/response/login_response.dart';

class UserLoginMapper {

  static UserLoginEntity userLoginDBtoEntity(LoginResponse login) => UserLoginEntity(
    id: login.user.id,
    userName: login.user.fullName,
    accessToken: login.token, 
  );

}