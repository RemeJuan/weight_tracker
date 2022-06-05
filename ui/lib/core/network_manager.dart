import 'dart:convert';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:weight_tracker/core/constants.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/router/app_router.gr.dart';

import 'exceptions.dart';

class NetworkManager {
  final http.Client client;
  final FlutterSecureStorage secureStorage;

  NetworkManager({required this.client, required this.secureStorage});

  Future<http.Response> apiGet(Uri url) async {
    final response = await client.get(
      url,
      headers: await _headers(),
    );

    foundation.debugPrint('$url - GET ${response.statusCode}');

    if (response.statusCode == 200) {
      return response;
    } else if ([401, 403].contains(response.statusCode)) {
      return _handleUnauthorized(response);
    } else {
      throw ServerException();
    }
  }

  Future<http.Response> apiPost(Uri url, Map<String, dynamic> body) async {
    final response = await client.post(
      url,
      headers: await _headers(),
      body: jsonEncode(body),
    );
    foundation.debugPrint('$url - POST ${response.statusCode}');

    if (response.statusCode == 200) {
      return response;
    } else if ([401, 403].contains(response.statusCode)) {
      return _handleUnauthorized(response);
    } else {
      throw ServerException();
    }
  }

  Future<http.Response> apiDelete(Uri url) async {
    final response = await client.delete(
      url,
      headers: await _headers(),
    );

    foundation.debugPrint('$url - DELETE ${response.statusCode}');

    if (response.statusCode == 200) {
      return response;
    } else if ([401, 403].contains(response.statusCode)) {
      return _handleUnauthorized(response);
    } else {
      throw ServerException();
    }
  }

  Future<http.Response> apiPatch(Uri url, Map<String, dynamic> body) async {
    final response = await client.patch(
      url,
      headers: await _headers(),
      body: jsonEncode(body),
    );

    foundation.debugPrint('$url - POST ${response.statusCode}');

    if (response.statusCode == 200) {
      return response;
    } else if ([401, 403].contains(response.statusCode)) {
      return _handleUnauthorized(response);
    } else {
      throw ServerException();
    }
  }

  Future<http.Response> _handleUnauthorized(
    http.Response response,
  ) async {
    sl<AppRouter>().replaceAll([const LogoutRoute()]);

    return response;
  }

  Future<Map<String, String>> _headers() async {
    return {
      "x-auth-token": "${await secureStorage.read(key: SECURE_API_KEY)}",
      "Content-Type": "application/json"
    };
  }
}
