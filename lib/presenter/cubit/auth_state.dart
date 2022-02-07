part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  Unauthenticated();

  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthFailed extends AuthState {
  final String message;

  AuthFailed(this.message);

  @override
  List<Object?> get props => [message];
}
