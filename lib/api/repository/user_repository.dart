import 'package:estacy/api/provida/api_provider.dart';
import'dart:convert';

import 'package:estacy/authentication/verify_email.dart';

class UserRespository {
  final ApiProvider _apiProvider = ApiProvider();

  Future register(Map data) {
    var registerResponse = _apiProvider.post('/auth/register', data);
    return registerResponse;
  }
  Future VerifyEmail(Map data) {
    var registerResponse = _apiProvider.post('/auth/email/verify', data);
    return registerResponse;
  }
  Future login(Map data) {
    var registerResponse = _apiProvider.post('/auth/login', data);
    return registerResponse;
  }
  Future resetPasswordEmail(Map data) {
    var registerResponse = _apiProvider.post('/auth/password/email', data);
    return registerResponse;
  }
  Future verifyPasswordReset(Map data) {
    var registerResponse = _apiProvider.post('/auth/password/token', data);
    return registerResponse;
  }
  Future resetPassword(Map data) {
    var registerResponse = _apiProvider.post('/auth/password/reset', data);
    return registerResponse;
  }
}