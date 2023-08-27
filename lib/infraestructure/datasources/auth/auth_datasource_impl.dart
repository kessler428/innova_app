import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:innova/config/constants/api_constants.dart';
import 'package:innova/domain/datasources/auth/auth_datasource.dart';
import 'package:innova/domain/entities/auth/user_login_entity.dart';
import 'package:innova/infraestructure/mappers/auth/login_mapper.dart';
import 'package:innova/infraestructure/models/auth/request/login_request.dart';
import 'package:innova/infraestructure/models/auth/response/login_response.dart';
import 'package:innova/utils/helpers/exeptions_helper.dart';

class AuthDatasourceImpl extends AuthDatasource {

  // This is the dio instance that will be used to make HTTP requests
  late Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      }
    )
  );
  
  // This is the constructor where we validate the dio instance that will be used
  AuthDatasourceImpl([Dio? dio]) {
    this.dio = dio ?? this.dio;
  }
  
  @override
  Future<UserLoginEntity> postLogin(LoginRequest login) async {
    try{
      final Response<dynamic> response = await dio.post(
        'auth/login',
        data: jsonEncode(login),
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return true;
          },
        )
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      LoginResponse parsedResponse = LoginResponse.fromJson(response.data);

      UserLoginEntity userLogin = UserLoginMapper.userLoginDBtoEntity(parsedResponse);

      return userLogin;
    } catch(e) {
      rethrow;
    }
  }
  
}