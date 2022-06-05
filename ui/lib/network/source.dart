import 'dart:convert';

import 'package:weight_tracker/core/network_manager.dart';
import 'package:weight_tracker/core/uri_builder.dart';
import 'package:weight_tracker/models/user_model.dart';

class Source {
  final NetworkManager networkManager;
  final UriBuilder uriBuilder;

  Source({
    required this.networkManager,
    required this.uriBuilder,
  });

  Future<UserModel> registerUser(UserModel user) async {
    final url = uriBuilder.uri("sign_up");

    final payload = {
      "firstName": user.firstName,
      "lastName": user.lastName,
      "username": user.username,
      "password": user.password,
    };
    final response = await networkManager.apiPost(url, payload);
    final body = jsonDecode(response.body);

    return UserModel.fromJson(body);
  }
}
