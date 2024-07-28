import 'package:ecommerceapp/utils/firebase_handler.dart';

abstract class LoginClient {
  Future<bool> login(String userName, String passwrod);
}

class LoginClientImpl implements LoginClient {

  LoginClientImpl({required FirebaseHandler firebaseHandler}) : _firebaseHandler = firebaseHandler;

  final FirebaseHandler _firebaseHandler;

  @override
  Future<bool> login(String userName, String passwrod) async {
    return _firebaseHandler.login(userName, passwrod);
  }
}