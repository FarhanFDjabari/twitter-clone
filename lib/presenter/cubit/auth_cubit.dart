import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:twettir/common/cache.dart';
import 'package:twettir/models/User.dart';

import '../../services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService service;

  AuthCubit(this.service) : super(AuthInitial());

  void checkAuth() async {
    emit(AuthLoading());
    try {
      final result = await service.checkAuth();
      if (result != null) {
        emit(Authenticated(result));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await service.login(email: email, password: password);
      if (result == true) {
        emit(AuthSuccess('Successfully logged in'));
      } else {
        emit(AuthFailed('Login failed'));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void register(
      String email, String password, String name, String username) async {
    emit(AuthLoading());
    try {
      final result = await service.register(
          email: email, password: password, name: name, username: username);
      if (result == true) {
        emit(AuthSuccess('Successfully signup'));
      } else {
        emit(AuthFailed('Signup failed'));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logout() async {
    emit(AuthLoading());
    try {
      await Cache.deleteData('user_data');
      emit(AuthSuccess('Successfully logged out'));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
