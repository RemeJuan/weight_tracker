import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/failures.dart';
import 'package:weight_tracker/models/user_model.dart';
import 'package:weight_tracker/network/source.dart';

class Network {
  final Source _source;

  Network(this._source);

  Future<Either<Failure, UserModel>> registerUser(UserModel user) async {
    try {
      final response = await _source.registerUser(user);

      return Right(response);
    } on AssertionError {
      return const Left(FormatFailure());
    } on SocketException {
      return const Left(SocketFailure());
    } catch (error) {
      return const Left(ServerFailure());
    }
  }
}
