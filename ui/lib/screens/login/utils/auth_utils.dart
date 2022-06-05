import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weight_tracker/core/constants.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/models/user_model.dart';

class AuthUtils {
  static void loadUserIntoMemory() async {
    final user = await sl<FlutterSecureStorage>().read(key: SECURE_USER_KEY);

    if (user != null) {
      final u = jsonDecode(user);
      sl<UserModel>().copyWith(
        firstName: u['firstName'],
        lastName: u['lastName'],
        username: u['username'],
      );
    }
  }

  static void storeUser(UserModel user) async {
    await sl<FlutterSecureStorage>().write(
      key: SECURE_USER_KEY,
      value: jsonEncode({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'username': user.username,
      }),
    );
  }

  static void storeToken(UserModel user) async {
    await sl<FlutterSecureStorage>().write(
      key: SECURE_API_KEY,
      value: user.token,
    );
  }
}
