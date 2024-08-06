import 'package:flutter_demo_structure/core/api/base_response/base_response.dart';

abstract class AuthRepository {

  Future<BaseResponse> logout();
}
