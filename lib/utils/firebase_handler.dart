import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseHandler {
  // FirebaseHandler class is a singleton class

  final String _collectionName = 'users';
  final String _discountedPriceKey = 'showDiscountedPrice';

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FirebaseRemoteConfig get remoteConfig => FirebaseRemoteConfig.instance;

  bool _userExists(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.isNotEmpty;
  }

  Future<bool> login(String userName, String password) async {
    final snapshot = await firestore
        .collection(_collectionName)
        .where('userName', isEqualTo: userName)
        .where('password', isEqualTo: password)
        .get();
    return _userExists(snapshot);
  }

  Future<bool> register(String userName, String password) async {
    final snapshot = await firestore
        .collection(_collectionName)
        .where('userName', isEqualTo: userName)
        .get();
    if (_userExists(snapshot)) {
      return false;
    }
    await firestore
        .collection(_collectionName)
        .add({'userName': userName, 'password': password});
    return true;
  }

  Future<void> _setRemoteConfigDefaults() async  {
    await remoteConfig.setDefaults({_discountedPriceKey: false});
  }

  Future<void> _fetchAndActivateRemoteConfig() async {
    await remoteConfig.fetchAndActivate();
  }

  Future<void> initializeRemoteConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(
          seconds: 5,
        ),
        minimumFetchInterval: const Duration(minutes: 1)));
    _setRemoteConfigDefaults();
    _fetchAndActivateRemoteConfig();
  }

  bool get showDiscountedPrice {
    final res = remoteConfig.getBool(_discountedPriceKey);
    return res;
    //return false;
  }
}
