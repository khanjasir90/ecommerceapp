import 'package:ecommerceapp/features/auth/register/data/source/register_client.dart';
import 'package:ecommerceapp/features/auth/register/domain/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  RegisterRepoImpl({required RegisterClient registerClient}) : _registerClient = registerClient;

  final RegisterClient _registerClient;

  @override
  Future<bool> register(String userName, String passwrod) {
    return _registerClient.register(userName, passwrod);
  }
  
}