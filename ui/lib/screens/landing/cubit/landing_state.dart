import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weight_tracker/models/user_weight_model.dart';

part 'landing_state.freezed.dart';

enum HistoryStatus { loading, loaded, error }

@freezed
class LandingState with _$LandingState {
  const LandingState._();

  const factory LandingState({
    required HistoryStatus historyStatus,
    required List<UserWeightModel> history,
  }) = _LandingState;

  factory LandingState.initial() => const LandingState(
        historyStatus: HistoryStatus.loading,
        history: [],
      );
}
