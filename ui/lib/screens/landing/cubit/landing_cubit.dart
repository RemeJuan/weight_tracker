import 'package:bloc/bloc.dart';
import 'package:weight_tracker/models/user_weight_model.dart';
import 'package:weight_tracker/network/network.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_state.dart';

import 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  final Network _network;

  LandingCubit(this._network) : super(LandingState.initial());

  Future<void> getHistory() async {
    emit(state.copyWith(historyStatus: HistoryStatus.loading));
    try {
      final inputEither = await _network.getHistory();
      inputEither.fold(
        (failure) => emit(state.copyWith(historyStatus: HistoryStatus.error)),
        (userWeights) => emit(state.copyWith(
          historyStatus: HistoryStatus.loaded,
          history: userWeights,
        )),
      );
    } catch (e) {
      emit(state.copyWith(historyStatus: HistoryStatus.error));
    }
  }

  Future<void> editWeight(UserWeightModel weight) async {
    try {
      final inputEither = await _network.editWeight(weight);
      inputEither.fold(
        (failure) => emit(state.copyWith(historyStatus: HistoryStatus.error)),
        (_) {
          final idx = state.history.indexWhere((w) => w.id == weight.id);
          final newHistory = <UserWeightModel>[...state.history];
          newHistory[idx] = weight;

          emit(state.copyWith(
            historyStatus: HistoryStatus.loaded,
            history: newHistory.toList(),
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(historyStatus: HistoryStatus.error));
    }
  }

  Future<void> deleteWeight(UserWeightModel weight) async {
    try {
      final inputEither = await _network.deleteWeight(weight);

      inputEither.fold(
        (f) => emit(state.copyWith(historyStatus: HistoryStatus.error)),
        (_) {
          final newHistory = state.history.where((w) => w.id != weight.id);
          emit(state.copyWith(
            historyStatus: HistoryStatus.loaded,
            history: newHistory.toList(),
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(historyStatus: HistoryStatus.error));
    }
  }
}
