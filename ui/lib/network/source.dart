import 'dart:convert';

import 'package:weight_tracker/core/network_manager.dart';
import 'package:weight_tracker/core/uri_builder.dart';
import 'package:weight_tracker/models/user_model.dart';
import 'package:weight_tracker/models/user_weight_model.dart';

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

  Future<UserModel> loginUser(UserModel user) async {
    final url = uriBuilder.uri("login");

    final payload = {
      "username": user.username,
      "password": user.password,
    };
    final response = await networkManager.apiPost(url, payload);
    final body = jsonDecode(response.body);

    return UserModel.fromJson(body);
  }

  Future<List<UserWeightModel>> getHistory() async {
    final url = uriBuilder.uri("get_weight_history");

    final response = await networkManager.apiGet(url);
    final body = jsonDecode(response.body);

    return body.map((e) => UserWeightModel.fromJson(e)).toList();
  }
}
