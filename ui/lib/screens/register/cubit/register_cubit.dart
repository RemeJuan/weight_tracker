import 'package:bloc/bloc.dart';
import 'package:weight_tracker/models/user_model.dart';
import 'package:weight_tracker/network/network.dart';
import 'package:weight_tracker/screens/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Network network;

  RegisterCubit(this.network) : super(RegisterState.initial());

  Future<void> init(UserModel user) async {
    try {
      final inputEither = await network.registerUser(user);
      inputEither.fold(
        (l) => emit(const RegisterState.error()),
        (r) => emit(RegisterState.loaded(r)),
      );
    } catch (e) {
      emit(const RegisterState.error());
    }
  }
}
