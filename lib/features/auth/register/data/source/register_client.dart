import 'package:ecommerceapp/utils/firebase_handler.dart';

abstract class RegisterClient {
  Future<bool> register(String userName, String passwrod);
}

class RegisterClientImpl implements RegisterClient {
  RegisterClientImpl({required FirebaseHandler firebaseHandler}) : _firebaseHandler = firebaseHandler;

  final FirebaseHandler _firebaseHandler;

  @override
  Future<bool> register(String userName, String passwrod) async {
    return _firebaseHandler.register(userName, passwrod);
  }
}