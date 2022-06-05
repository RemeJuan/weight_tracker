import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/failures.dart';
import 'package:weight_tracker/models/user_model.dart';
import 'package:weight_tracker/models/user_weight_model.dart';
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

  Future<Either<Failure, UserModel>> loginUser(UserModel user) async {
    try {
      final response = await _source.loginUser(user);

      return Right(response);
    } on AssertionError {
      return const Left(FormatFailure());
    } on SocketException {
      return const Left(SocketFailure());
    } catch (error) {
      return const Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<UserWeightModel>>> getHistory() async {
    try {
      final response = await _source.getHistory();

      return Right(response);
    } on AssertionError {
      return const Left(FormatFailure());
    } on SocketException {
      return const Left(SocketFailure());
    } catch (error) {
      return const Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> editWeight(
    UserWeightModel weight,
  ) async {
    try {
      await _source.editWeight(weight);

      return const Right(true);
    } on AssertionError {
      return const Left(FormatFailure());
    } on SocketException {
      return const Left(SocketFailure());
    } catch (error) {
      return const Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> deleteWeight(
    UserWeightModel weight,
  ) async {
    try {
      await _source.deleteWeight(weight);

      return const Right(true);
    } on AssertionError {
      return const Left(FormatFailure());
    } on SocketException {
      return const Left(SocketFailure());
    } catch (error) {
      return const Left(ServerFailure());
    }
  }
}
