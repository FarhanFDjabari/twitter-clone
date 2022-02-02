import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/User.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository repository;

  AuthCubit(this.repository) : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await repository.login(email: email, password: password);
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void register(
      String email, String password, String name, String username) async {
    emit(AuthLoading());
    try {
      final result = await repository.register(
          email: email, password: password, name: name, username: username);
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
