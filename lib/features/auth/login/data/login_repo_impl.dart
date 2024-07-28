import 'package:ecommerceapp/features/auth/login/data/source/login_client.dart';
import 'package:ecommerceapp/features/auth/login/domain/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRepoImpl({required LoginClient loginClient}) : _loginClient = loginClient;

  final LoginClient _loginClient;

  @override
  Future<bool> login(String userName, String passwrod) {
    return _loginClient.login(userName, passwrod);
  }

}