import 'package:bloc/bloc.dart';
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
}
